module UsNewsRankings
  module Education
    module GraduateSchools
      module LawPartTime
        class Category < UsNewsRankings::Category
          def source_urls
            return {
              2017 => [],
              2016 => [],
              2015 => [],
              2014 => [],
              2013 => [],
              2012 => []
            }
          end
        end
      end
    end
  end
end
