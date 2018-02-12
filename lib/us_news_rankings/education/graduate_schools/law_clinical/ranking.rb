module UsNewsRankings
  module Education
    module GraduateSchools
      module LawClinical
        class Ranking < UsNewsRankings::Ranking
          def tuition
            row.at_css(".search_tuition").text.strip #.gsub(" per year (full-time)","")
          end

          def enrollment
            row.at_css(".v_ft_enrolled").text.strip #.to_i
          end

          def to_h
            {
              rank: rank.to_i, # assumes school is ranked
              tie: tie,
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
