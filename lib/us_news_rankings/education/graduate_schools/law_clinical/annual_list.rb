module UsNewsRankings
  module Education
    module GraduateSchools
      module LawClinical
        class AnnualList < UsNewsRankings::AnnualList
          include CategoryAwareness
        end
      end
    end
  end
end
