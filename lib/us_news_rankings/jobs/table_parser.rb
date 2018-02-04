require "csv"
require "json"

module UsNewsRankings
  class TableParser
    attr_reader :tables_dir

    # @param [String] tables_dir a directory containing multiple HTML files comprising a related set of rankings tables. files can be full pages or just <table> elements.
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

    CSV_HEADERS = ["rankings_list", "rankings_year", "school_name", "rank"]

    def all_tables_valid?
      pages.map{|page| page.table_valid? }.uniq == [true]
    end

    def data_dir
      "./data/education/todo/"
    end

    def csv_filepath
      File.join(data_dir, "#{rankings_year}.csv")
    end

    def json_filepath
      File.join(data_dir, "#{rankings_year}.json")
    end

    def perform
      puts "PARSING #{pages.count} TABLES FROM: #{tables_dir}"
      return false unless all_tables_valid?

      remove_data_files

      rankings = [
        {rankings_list: "my_list", rankings_year: 2000, school_name: "xyz", rank: 3},
        {rankings_list: "my_list", rankings_year: 2000, school_name: "abc", rank: 1},
        {rankings_list: "my_list", rankings_year: 2000, school_name: "def", rank: 2},
      ].sort_by{|ranking| ranking[:rank] }

      File.open(json_filepath, "w") do |f|
        f.write(JSON.pretty_generate(rankings))
      end

      CSV.open(csv_filepath, "w", :write_headers=> true, :headers => CSV_HEADERS) do |csv|
        rankings.each do |ranking|
          csv << ranking.values
        end
      end

      return true
    end

    def remove_data_files
      FileUtils.rm_rf(csv_filepath)
      FileUtils.rm_rf(json_filepath)
    end
  end
end
