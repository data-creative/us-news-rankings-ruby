module UsNewsRankings
  module Education
    module GraduateSchools
      module Law
        class Category < UsNewsRankings::Category
          def rankings
            return [{}, {}, {}]
          end
        end
      end
    end
  end
end
