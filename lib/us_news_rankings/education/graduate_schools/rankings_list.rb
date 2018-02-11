module UsNewsRankings
  module Education
    module GraduateSchools
      class RankingsList
        def initialize(year)
          @year = year
        end

        def rankings
          return [{}, {}, {}]
        end
      end
    end
  end
end
