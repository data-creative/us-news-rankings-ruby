module UsNewsRankings
  class Client
    attr_reader :category_namespace_path, :year

    # @param category [String] a namespace of one of the rankings categories
    # @param year [Integer] the rankings year
    def initialize(category:, year:)
      @category_namespace_path = category
      @year = year
    end

    def category
      "UsNewsRankings::#{category_namespace_path.split("/").map{|str| str.camelcase}.join("::")}".constantize::Category.new
    end

    def annual_list
      category.namespace.constantize::AnnualList.new(category: category, year: year)
    end

    def rankings
      annual_list.rankings
    end
  end
end
