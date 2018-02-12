module UsNewsRankings
  class Category
    attr_reader :year

    def initialize(year)
      @year = year
    end

    def rankings
      raise "please implement #rankings on the child class"
    end
  end
end
