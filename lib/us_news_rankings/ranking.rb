module UsNewsRankings
  class Ranking
    attr_reader :row

    # @param row [Nokogiri::XML::Element] a rankings table row ("tr") element
    def initialize(row)
      @row = row
    end

    # converts weird dash character (#8212) to normal dash, then removes weird characters like <U+200B>
    def school_name
      name = row.at_css(".school-name").text.strip
      name = name.chars.map{|char| char.ord == 8212 ? " - " : char}.select{|char| char.ascii_only? }.join
    end

    def school_city
      row.at_css(".location").try(:text).try(:strip) # Rutgers doesn't list a location
    end

    def rank
      @rank || row.at_css(".rankscore-bronze").text.strip.gsub("#","").gsub("Tie","")
    end

    def ranked?
      return true if rank.to_i > 0
      return false
    end

    def tie
      row.at_css(".rankscore-bronze").text.include?("Tie")
    end
  end
end
