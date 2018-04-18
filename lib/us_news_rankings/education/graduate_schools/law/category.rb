module UsNewsRankings
  module Education
    module GraduateSchools
      module Law
        class Category < UsNewsRankings::Category
          def source_urls
            return {
              2018 => ["https://web.archive.org/web/20180417060144/https://www.usnews.com/best-graduate-schools/top-law-schools/law-rankings"],
              2017 => ["https://web.archive.org/web/20171230030133/https://www.usnews.com/best-graduate-schools/top-law-schools/law-rankings"],
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
