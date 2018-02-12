module UsNewsRankings
  module Education
    module GraduateSchools
      module LawPartTime
        class AnnualList < UsNewsRankings::AnnualList
          def rankings
            return [{}, {}, {}]
          end
        end
      end
    end
  end
end
