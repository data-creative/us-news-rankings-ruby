require 'active_support/core_ext/object/blank'
require 'nokogiri'
require 'open-uri'

module UsNewsRankings
  class Page
    attr_reader :url

    # @param url [String] the page's source url
    def initialize(url)
      @url = url
    end

    # @return [Nokogiri::HTML::Document]
    def document
      @document ||= Nokogiri::HTML(open(url))
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
  end
end
