require "csv"
require "json"

module UsNewsRankings
  class TableParser
    attr_reader :tables_dir

    # @param tables_dir [String] a directory containing multiple HTML files comprising a related set of rankings tables. files can contain full pages or just <table> elements.
    def initialize(tables_dir)
      @tables_dir = tables_dir
    end

    def rankings_year
      tables_dir.scan(/\d+/).first.to_i
    end

    def rankings_list
      tables_dir.split("/")[2..4].join("/")
    end

    def data_dir
      "./data/#{rankings_list}"
    end

    def csv_filepath
      File.join(data_dir, "#{rankings_year}.csv")
    end

    def json_filepath
      File.join(data_dir, "#{rankings_year}.json")
    end

    def table_paths
      Dir.entries(tables_dir).reject{|e| [".", ".."].include?(e)}.map{ |f| File.join(tables_dir, f)}
    end

    # @return [Array] a related collection of UsNewsRankings::Page objects
    def pages
      @pages ||= table_paths.map{ |filepath| UsNewsRankings::Page.new(filepath) }
    end

    def valid?
      return false unless all_tables_valid?
      return false unless rankings_year_valid?
      return false unless rankings_list_valid?
      return true
    end

    def all_tables_valid?
      pages.map{|page| page.table_valid? }.uniq == [true]
    end

    def rankings_list_valid?
      UsNewsRankings::LISTS.include?(rankings_list)
    end

    def rankings_year_valid?
      rankings_year > 2000
    end

    def perform
      return false unless valid?
      remove_data_files
      #puts "PARSING #{pages.count} TABLES FROM: #{tables_dir}"
      FileUtils.mkdir_p(data_dir)
      write_json
      write_csv
      return true
    end

    # @example [{school_name: "abc", rank: 1}, {school_name: "def", rank: 2}, {school_name: "xyz", rank: 3}]
    def rankings
      @rankings || extract_rankings.sort_by{|ranking| ranking[:rank].to_i }
    end

    def extract_rankings
      rankings = []
      pages.each do |page|
        page.table_rows.each do |row|
          #ranking = UsNewsRankings::Ranking.new(list: rankings_list, year: rankings_year, row: row)
          ranking = UsNewsRankings::Ranking.new(row)
          rankings << ranking.to_h if ranking.ranked?
        end
      end
      return rankings
    end

    def write_csv
      headers = rankings.first.keys.map{|k| k.to_s} #> ["rankings_list", "rankings_year", "school_name", "rank"]
      headers = ["rankings_list", "rankings_year"] + headers

      CSV.open(csv_filepath, "w", :write_headers=> true, :headers => headers) do |csv|
        rankings.each do |ranking|
          csv << ([rankings_list, rankings_year] + ranking.values)
        end
      end
    end

    def write_json
      File.open(json_filepath, "w") do |f|
        f.write(JSON.pretty_generate({
          rankings_list: rankings_list,
          rankings_year: rankings_year,
          rankings: rankings
        }))
      end
    end

    def remove_data_files
      FileUtils.rm_rf(csv_filepath)
      FileUtils.rm_rf(json_filepath)
    end
  end
end
