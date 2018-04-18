require "active_support/inflector"

module UsNewsRankings
  class AnnualList
    attr_reader :year

    def initialize(year)
      @year = year
    end

    def category
      self.class.name.gsub("AnnualList","Category").constantize.new
    end

    def html_dir
      File.join("./web/#{category.namespace_path}", year.to_s)
    end

    def source_urls
      category.source_urls[year]
    end

    def pages
      source_urls.each_with_index.map{|url, i| UsNewsRankings::Page.new({annual_list: self, url: url, number: i + 1})}
    end

    # @example [{school_name: "abc", rank: 1}, {school_name: "def", rank: 2}, {school_name: "xyz", rank: 3}]
    def rankings
      @rankings || extract_rankings.sort_by{|ranking| [ranking[:rank].to_i, ranking[:school_name]] }
    end # consider aggregating rankings from each page and allowing each page to recognize its own rankings

    def extract_rankings
      extracted_rankings = []
      pages.each do |page|
        page.table_rows.each do |row|
          ranking = "#{self.class.to_s.deconstantize}::Ranking".constantize.new({annual_list: self, row: row})
          extracted_rankings << ranking.to_h if ranking.ranked?
        end
      end
      return extracted_rankings
    end
  end
end
