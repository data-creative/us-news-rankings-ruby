module UsNewsRankings
  module Education
    module GraduateSchools
      module Law
        class Category < UsNewsRankings::Category
          def source_urls
            return {
              2018 => ["https://web.archive.org/web/20180417060144/https://www.usnews.com/best-graduate-schools/top-law-schools/law-rankings"],
              2017 => ["https://web.archive.org/web/20171230030133/https://www.usnews.com/best-graduate-schools/top-law-schools/law-rankings"],
              2016 => ["https://web.archive.org/web/20160714205338/http://grad-schools.usnews.rankingsandreviews.com/best-graduate-schools/top-law-schools/law-rankings"],
              2015 => ["https://web.archive.org/web/20151231194248/http://grad-schools.usnews.rankingsandreviews.com/best-graduate-schools/top-law-schools/law-rankings"],
              2014 => ["https://web.archive.org/web/20141228143218/http://grad-schools.usnews.rankingsandreviews.com/best-graduate-schools/top-law-schools/law-rankings"],
              2013 => ["https://web.archive.org/web/20131216211309/http://grad-schools.usnews.rankingsandreviews.com/best-graduate-schools/top-law-schools/law-rankings"],
              2012 => ["https://web.archive.org/web/20121224123421/http://grad-schools.usnews.rankingsandreviews.com/best-graduate-schools/top-law-schools/law-rankings"],
              2011 => ["https://web.archive.org/web/20111228035934/http://grad-schools.usnews.rankingsandreviews.com/best-graduate-schools/top-law-schools/law-rankings"]
            }
          end
        end
      end
    end
  end
end
