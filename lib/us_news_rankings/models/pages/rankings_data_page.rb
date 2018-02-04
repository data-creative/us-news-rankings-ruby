module UsNewsRankings
  class RankingsDataPage < Page
    def table
      @table ||= document.at_css("table.ranking-data")
    end
  end
end
