module UsNewsRankings
  module Education
    module GraduateSchools
      module LawClinical
        class Category < UsNewsRankings::Category
          SOURCE_URLS = {
            2017 => ["https://web.archive.org/web/20171230030145/https://www.usnews.com/best-graduate-schools/top-law-schools/clinical-training-rankings"],
            2016 => ["https://web.archive.org/web/20161024174100/http://grad-schools.usnews.rankingsandreviews.com/best-graduate-schools/top-law-schools/clinical-training-rankings"],
            2015 => ["https://web.archive.org/web/20150626162959/http://grad-schools.usnews.rankingsandreviews.com/best-graduate-schools/top-law-schools/clinical-training-rankings"],
            2014 => ["https://web.archive.org/web/20140921074933/http://grad-schools.usnews.rankingsandreviews.com:80/best-graduate-schools/top-law-schools/clinical-training-rankings"],
            2013 => ["https://web.archive.org/web/20130815204940/http://grad-schools.usnews.rankingsandreviews.com/best-graduate-schools/top-law-schools/clinical-training-rankings"],
            2012 => ["https://web.archive.org/web/20120729115453/http://grad-schools.usnews.rankingsandreviews.com/best-graduate-schools/top-law-schools/clinical-training-rankings"]
          }

          def source_urls
            SOURCE_URLS[year]
          end
        end
      end
    end
  end
end
