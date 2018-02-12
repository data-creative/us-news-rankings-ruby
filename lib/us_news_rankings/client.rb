module UsNewsRankings
  class Client
    attr_reader :category, :year

    # @param category [String] one of the rankings categories
    # @param year [Integer] the rankings year
    def initialize(category:, year:)
      @category = category
      @year = year
    end

    def annual_list
      category.namespace.constantize::AnnualList.new(category: category, year: year)
    end

    def rankings
      annual_list.rankings
    end
  end
end
