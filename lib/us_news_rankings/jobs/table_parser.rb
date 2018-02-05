require "csv"
require "json"

module UsNewsRankings
  class TableParser
    attr_reader :tables_dir

    # @param tables_dir [String] a directory containing multiple HTML files comprising a related set of rankings tables. files can be full pages or just <table> elements.
    def initialize(tables_dir)
      @tables_dir = tables_dir
    end

    def rankings_year
      tables_dir.scan(/\d+/).first.to_i
    end # todo: validate that the path contains a year

    def table_paths
      Dir.entries(tables_dir).reject{|e| [".", ".."].include?(e)}.map{ |f| File.join(tables_dir, f)}
    end

    # @return [Array] a related collection of UsNewsRankings::Page objects
    def pages
      @pages ||= table_paths.map{ |filepath| UsNewsRankings::Page.new(filepath) }
    end

    def all_tables_valid?
      pages.map{|page| page.table_valid? }.uniq == [true]
    end

    def rankings_list
      "todo/todo/my_list" # TODO: parse filepath or pass via initializer
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

    def perform
      return false unless all_tables_valid?
      remove_data_files
      #puts "PARSING #{pages.count} TABLES FROM: #{tables_dir}"
      write_json
      write_csv
      return true
    end

    # @example
    # [
    #   {rankings_list: "my_list", rankings_year: 2000, school_name: "abc", rank: 1},
    #   {rankings_list: "my_list", rankings_year: 2000, school_name: "def", rank: 2},
    #   {rankings_list: "my_list", rankings_year: 2000, school_name: "xyz", rank: 3}
    # ]
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
