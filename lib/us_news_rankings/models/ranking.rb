module UsNewsRankings
  class Ranking
    attr_reader :list, :year, :row

    # @param [String] list one of the predefined rankings lists (e.g. "education/grad-school/law-part-time")
    # @param [Integer] year the ranking year (e.g. 2017)
    # @param [Nokogiri::XML::Element] row a rankings table row ("tr") element
    def initialize(list:, year:, row:)
      @list = list
      @year = year
      @row = row
    end

    # converts weird dash character (#8212) to normal dash, then removes weird characters like <U+200B>
    def school_name
      name = row.at_css(".school-name").text.strip
      name = name.chars.map{|char| char.ord == 8212 ? " - " : char}.select{|char| char.ascii_only? }.join
    end

    #def school_city
    #  row.at_css(".location").try(:text).try(:strip) # rutgers doesn't have a location
    #end

    def rank
      @rank || row.at_css(".rankscore-bronze").text.strip.gsub("#","").gsub("Tie","")
    end

    def ranked?
      return true if rank.to_i > 0
      return false
    end

    #def tie
    #  row.at_css(".rankscore-bronze").text.include?("Tie")
    #end

    def to_h
      {
        rankings_list: list,
        rankings_year: year.to_i,
        school_name: school_name,
        rank: rank.to_i # assumes numeric_rank? == true
      }
    end
  end
end
