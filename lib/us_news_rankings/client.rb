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
      [{}, {}, {}]
    end

    # A white list of accepted/valid rankings categories.
    CATEGORIES = [
      "education/graduate_schools/law",
      "education/graduate_schools/law_clinical",
      "education/graduate_schools/law_part_time",
    ]

    class InvalidCategory < StandardError ; end

    def validates_category
      raise InvalidCategory, category unless CATEGORIES.include?(category)
    end
  end
end
