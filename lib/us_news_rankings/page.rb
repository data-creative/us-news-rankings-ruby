module UsNewsRankings
  class Page
    attr_reader :url

    # @param url [String] the page's source url
    def initialize(url)
      @url = url
    end
  end
end
