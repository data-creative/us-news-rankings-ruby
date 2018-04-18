module UsNewsRankings
  module Education
    module GraduateSchools
      module Law
        class AnnualList < UsNewsRankings::AnnualList
          include CategoryAwareness
        end
      end
    end
  end
end
