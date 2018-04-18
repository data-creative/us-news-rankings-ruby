module UsNewsRankings
  module Education
    module GraduateSchools
      module Law
        class Ranking < UsNewsRankings::Ranking
          def rank_selector
            #case year
            #when 2014, 2013, 2012
            #  return ".rankings-score"
            #else
            #  return ".rankscore-bronze"
            #end
            ".rankscore-bronze"
          end

          def rank
            @rank || row.at_css(rank_selector).text.strip.gsub("#","").gsub("Tie","")
          end

          def tie?
            row.at_css(rank_selector).text.include?("Tie")
          end

          def tuition
            row.at_css(".search_tuition").text.strip #.gsub(" per year (full-time)","")
          end

          def enrollment
            row.at_css(".v_ft_enrolled").text.strip #.to_i
          end

          def to_h
            {
              rank: rank.to_i, # assumes school is ranked
              tie: tie?,
              school_name: school_name,
              school_city: school_city,
              tuition: tuition,
              enrollment: enrollment
            }
          end
        end
      end
    end
  end
end
