module UsNewsRankings
  class FlexPage < Page
    def table
      @table ||= document.at_css("table.flex-table")
    end
  end
end
