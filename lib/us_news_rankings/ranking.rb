require 'active_support/core_ext/object/try'

module UsNewsRankings
  class Ranking
    attr_reader :year, :row

    # @param year [Integer] the ranking's page source
    # @param row [Nokogiri::XML::Element] a rankings table row ("tr") element
    def initialize(year:, row:)
      @year = year
      @row = row
    end

    def rank
      raise "Oh, please implement #rank in the child class."
    end

    def ranked?
      return true if rank.to_i > 0
      return false
    end

    # converts weird dash character (#8212) to normal dash, then removes weird characters like <U+200B>
    def school_name
      name = row.at_css(".school-name").text.strip
      name = name.chars.map{|char| char.ord == 8212 ? " - " : char}.select{|char| char.ascii_only? }.join
    end

    def school_city
      row.at_css(".location").try(:text).try(:strip) # Rutgers doesn't list a location
    end

    def tie?
      raise "Oh, please implement #tie? in the child class."
    end

    def to_h
      raise "Oh, please implement #to_h in the child class."
    end
  end
end
