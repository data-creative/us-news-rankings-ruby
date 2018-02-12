require "active_support/inflector"

module UsNewsRankings
  class Category
    attr_reader :year

    def initialize(year)
      @year = year
    end

    def source_urls
      raise "Oh, please implement #source_urls on the child class."
    end

    # it should transform UsNewsRankings::Education::GraduateSchools::LawClinical::Category
    # ... into "education/graduate_schools/law_clinical"
    def namespace_path
      self.class.to_s.deconstantize.gsub("UsNewsRankings::","").split("::").map{|str| str.underscore}.join("/")
    end

    def html_dir
      File.join("./web/#{namespace_path}", year.to_s)
    end

    def pages
      source_urls.each_with_index.map{|url, i| UsNewsRankings::Page.new({category: self, url: url, number: i + 1})}
    end

    # @example [{school_name: "abc", rank: 1}, {school_name: "def", rank: 2}, {school_name: "xyz", rank: 3}]
    def rankings
      @rankings || extract_rankings.sort_by{|ranking| ranking[:rank].to_i }
    end

    def extract_rankings
      extracted_rankings = []
      pages.each do |page|
        page.table_rows.each do |row|
          ranking = "#{self.class.to_s.deconstantize}::Ranking".constantize.new({year: year, row: row})
          extracted_rankings << ranking.to_h if ranking.ranked?
        end
      end
      return extracted_rankings
    end
  end
end
