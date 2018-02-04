module UsNewsRankings
  class TableParser

    # @param [UsNewsRankings::Table] table
    def initialize(table)
      @table = table
    end

    def perform
      File.rm_rf("./data/#{list}")

    end
  end
end
