module UsNewsRankings
  # Client provides an alternative, indirect interface into the data.
  class Client
    attr_reader :category_namespace_path, :year

    # @param category [String] a namespace of one of the rankings categories (e.g. "education/graduate_schools/law_clinical")
    # @param year [Integer] the rankings year (e.g. 2016)
    #
    # @example Client.new(category: "education/graduate_schools/law_clinical", year: 2016)
    #
    def initialize(category:, year:)
      @category_namespace_path = category
      @year = year
    end

    def category
      "UsNewsRankings::#{category_namespace_path.split("/").map{|str| str.camelcase}.join("::")}".constantize::Category.new
    end

    def annual_list
      category.namespace.constantize::AnnualList.new(year)
    end

    def rankings
      annual_list.rankings
    end
  end
end
