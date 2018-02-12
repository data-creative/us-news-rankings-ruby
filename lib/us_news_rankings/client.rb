module UsNewsRankings
  class Client
    attr_reader :category, :year

    # @param category [String] one of the rankings categories
    # @param year [Integer] the rankings year
    def initialize(category:, year:)
      @category = category
      @year = year
    end

    def rankings
      category.new(year).rankings
    end
  end
end
