module UsNewsRankings
  class Category
    def source_urls
      raise "Oh, please implement #source_urls on the child class."
    end

    # @example "Education::GraduateSchools::LawClinical"
    def namespace
      self.class.to_s.deconstantize
    end

    # @example "education/graduate_schools/law_clinical"
    def namespace_path
      namespace.gsub("UsNewsRankings::","").split("::").map{|str| str.underscore}.join("/")
    end
  end
end
