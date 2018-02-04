require "nokogiri"
require "active_support/core_ext/object/blank"

module UsNewsRankings
  class Page
    attr_reader :filepath, :table_filepath

    # @param [String] filepath to a rankings page, (e.g. path/to/page1.html).
    def initialize(filepath)
      @filepath = filepath
    end

    def valid?
      return false unless filename.include?("page")
      return false unless table_valid?
      return true
    end

    def table_valid?
      table.class == Nokogiri::XML::Element ? true : false
    end

    # @return [Nokogiri::HTML::Document]
    def document
      @document ||= Nokogiri::HTML(open(filepath))
    end

    def table
      #raise "Oh, please implement #table in the child class"
      @table ||= (document.at_css("table.ranking-data") || document.at_css("table.searchresult") || document.at_css("table.flex-table"))
    end

    def table_body
      @table_body ||= table.at_css("tbody")
    end

    def table_rows
      @table_rows ||= table_body.children.select{ |tr|
        !tr.text.strip.blank? && !tr.text.include?("dblclick('rankingsEmbed')")
      }
    end

    def filename
      filepath.split("/").last
    end #TODO: move me and my tests to PageParser

    def table_filepath
      filepath.gsub(filename, filename.gsub("page", "table"))
    end #TODO: move me and my tests to PageParser

    #def year
    #  filepath.scan(/\d+/).first.to_i
    #end
#
    #def rankings_list
    #  path_parts = filepath.split("/")
    #  return "#{path_parts[-5]}/#{path_parts[-4]}/#{path_parts[-3]}" #> "education/grad-schools/law-part-time"
    #end

    def parse
      PageParser.new(self).perform if valid?
    end
  end
end
