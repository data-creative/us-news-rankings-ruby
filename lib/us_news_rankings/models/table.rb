module UsNewsRankings
  class Table
    attr_reader :filepath

    # @param [String] filepath to a rankings table, (e.g. path/to/table1.html).
    def initialize(filepath)
      @filepath = filepath
    end

    def parse
      TableParser.new(self).perform
    end
  end
end
