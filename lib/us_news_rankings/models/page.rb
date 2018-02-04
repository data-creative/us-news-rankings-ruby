require "nokogiri"

module UsNewsRankings
  class Page
    attr_reader :filepath, :table_filepath

    # @param [String] filepath to a rankings page, (e.g. path/to/page1.html).
    def initialize(filepath)
      @filepath = filepath
      validates_filename
      validates_rankings_table
    end

    # @return [Nokogiri::HTML::Document]
    def document
      @document ||= Nokogiri::HTML(open(filepath))
    end

    def table
      #raise "Oh, please implement #table in the child class"
      @table ||= (document.at_css("table.ranking-data") || document.at_css("table.searchresult") || document.at_css("table.flex-table"))
    end

    def table_filepath
      filepath.gsub("page", "table")
    end

    def year
      filepath.scan(/\d+/).first.to_i
    end

    def list
      path_parts = filepath.split("/")
      return "#{path_parts[-4]}/#{path_parts[-3]}" #> "grad-schools/law-part-time"
    end

    def parse
      PageParser.new(self).perform
    end

    class InvalidNameError < StandardError ; end
    class InvalidTableError < StandardError ; end

    private

    def validates_filename
      raise InvalidNameError, filepath unless filepath.include?("page")
    end

    def validates_rankings_table
      raise InvalidTableError, filepath unless table.class == Nokogiri::XML::Element
    end
  end
end
