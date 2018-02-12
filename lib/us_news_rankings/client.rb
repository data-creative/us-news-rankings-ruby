module UsNewsRankings
  class Client
    attr_reader :category, :year

    # A white list of accepted/valid rankings categories.
    CATEGORIES = [
      "education/graduate_schools/law",
      "education/graduate_schools/law_clinical",
      "education/graduate_schools/law_part_time",
    ]

    # @param category [String] one of the rankings categories
    # @param year [Integer] the rankings year
    def initialize(category:, year:)
      @category = category
      @year = year
    end

    def validates_category
      raise InvalidCategory, category unless category_valid?
    end

    def category_valid?
      CATEGORIES.include?(category)
    end

    class InvalidCategory < StandardError ; end
  end
end
