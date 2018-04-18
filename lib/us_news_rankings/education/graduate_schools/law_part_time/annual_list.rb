module UsNewsRankings
  module Education
    module GraduateSchools
      module LawPartTime
        class AnnualList < UsNewsRankings::AnnualList
          include CategoryAwareness
        end
      end
    end
  end
end
