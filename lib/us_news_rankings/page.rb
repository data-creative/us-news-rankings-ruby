require 'active_support/core_ext/object/blank'
require 'nokogiri'
require 'open-uri'

module UsNewsRankings
  class Page
    attr_reader :category, :url, :number

    # @param url [String] the page's source url
    def initialize(category:, url:, number:)
      @category = category
      @url = url
      @number = number
    end

    def html_filepath
      File.join(category.html_dir, "page#{number}.html")
    end

    def download_document
      FileUtils.mkdir_p(category.html_dir)
      File.open(html_filepath, 'w') do |file|
        file.write(url_source.to_xhtml(indent: 2)) # file.write(table.to_xhtml(indent: 2))
      end
    end

    def url_source
      puts "REQUESTING URL SOURCE FROM #{url}"
      @url_source ||= Nokogiri::HTML(open(url))
    end

    # @return [Nokogiri::HTML::Document]
    def document
      download_document unless File.exist?(html_filepath)
      @document ||= Nokogiri::HTML(open(html_filepath))
    end

    def table
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
