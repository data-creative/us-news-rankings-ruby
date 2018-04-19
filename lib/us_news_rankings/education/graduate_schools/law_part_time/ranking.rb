module UsNewsRankings
  module Education
    module GraduateSchools
      module LawPartTime
        class Ranking < UsNewsRankings::Ranking
          def rank_selector
            case year
            when 2013, 2012
              return ".rankings-score"
            else
              return ".rankscore-bronze"
            end
          end

          def unranked_selector
            ".rankings-score-rnp"
          end

          def rank_td
            @rank_td || row.at_css(rank_selector) || row.at_css(unranked_selector)
          end

          def rank
            @rank || rank_td.text.strip.gsub("#","").gsub("Tie","")
          end

          def tie?
            rank_td.text.include?("Tie")
          end

          def school_name
            name = row.at_css(".school-name").text.strip
            name = name.chars.map{|char| char.ord == 8212 ? " - " : char}.select{|char| char.ascii_only? }.join
          end

          def school_city
            row.at_css(".location").try(:text).try(:strip) # Rutgers doesn't list a location
          end

          def score
            row.at_css(".c_fin_tot_part_time_display").text.strip #.to_i
          end
          # alias part_time_score

          def peer_score
            row.at_css(".c_pt_avg_acad_rep_score").text.strip #.to_i
          end
          # alias peer_assessment_score

          def lsat_combined
            row.at_css(".pt_lsat_combined").text.strip
          end

          def lsat_25th
            lsat_combined.split("-").first #.to_i
          end

          def lsat_75th
            lsat_combined.split("-").last #.to_i
          end

          # handles cases when converting to float before dividing produces the wrong output
          # https://www.codecademy.com/en/forum_questions/50fe886f68fc44056f00626c
          def acceptance_rate
            #(row.at_css(".v_pt_acceptance_rate").text.strip.gsub("%","").to_d / 100).to_f
            row.at_css(".v_pt_acceptance_rate").text.strip
          end

          def enrollment
            row.at_css(".v_pt_enrolled").try(:text).try(:strip) #.to_i
          end

          def to_h
            {
              rank: rank.to_i, # assumes school is ranked
              tie: tie?,
              school_name: school_name,
              school_city: school_city,
              score: score,
              peer_score: peer_score,
              lsat_25th: lsat_25th,
              lsat_75th: lsat_75th,
              acceptance_rate: acceptance_rate,
              enrollment: enrollment
            }
          end
        end
      end
    end
  end
end
