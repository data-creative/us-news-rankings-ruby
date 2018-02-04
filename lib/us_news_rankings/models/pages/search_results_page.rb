module UsNewsRankings
  class SearchResultsPage < Page
    def table
      @table ||= document.at_css("table.searchresult")
    end
  end
end
