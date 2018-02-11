require "active_support/core_ext/object/try"
require 'bigdecimal' # enables "".to_d
require 'bigdecimal/util' # enables "".to_d

module UsNewsRankings
  class Ranking
    #attr_reader :list, :year, :row
#
    ## @param list [String] one of the predefined rankings lists (e.g. "education/grad-school/law-part-time")
    ## @param year [Integer] the ranking year (e.g. 2017)
    ## @param row [Nokogiri::XML::Element] a rankings table row ("tr") element
    #def initialize(list:, year:, row:)
    #  @list = list
    #  @year = year
    #  @row = row
    #end

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

    def score
      row.at_css(".c_fin_tot_part_time_display").text.strip.to_i
    end

    def peer_score
      row.at_css(".c_pt_avg_acad_rep_score").text.strip.to_f
    end

    def lsat_combined
      row.at_css(".pt_lsat_combined").text.strip
    end

    def lsat_25th
      lsat_combined.split("-").first.to_i
    end

    def lsat_75th
      lsat_combined.split("-").last.to_i
    end

    # handles cases when converting to float before dividing produces the wrong output
    # https://www.codecademy.com/en/forum_questions/50fe886f68fc44056f00626c
    def acceptance_rate
      (row.at_css(".v_pt_acceptance_rate").text.strip.gsub("%","").to_d / 100).to_f
    end

    def enrolled
      row.at_css(".v_pt_enrolled").text.to_i
    end

    def to_h
      {
        #rankings_list: list,
        #rankings_year: year.to_i,
        school_name: school_name,
        school_city: school_city,
        rank: rank.to_i, # assumes school is ranked
        tie: tie,
        score: score,
        peer_score: peer_score,
        lsat_25th: lsat_25th,
        lsat_75th: lsat_75th,
        acceptance_rate: acceptance_rate,
        enrollment: enrolled
      }
    end
  end
end
