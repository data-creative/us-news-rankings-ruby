module UsNewsRankings
  module Education
    module GraduateSchools
      module LawPartTime
        class Category < UsNewsRankings::Category
          def source_urls
            return {
              2018 => [
                "https://web.archive.org/web/20180417060151/https://www.usnews.com/best-graduate-schools/top-law-schools/part-time-law-rankings",
                "https://web.archive.org/web/20180323103820/https://www.usnews.com/best-graduate-schools/top-law-schools/part-time-law-rankings/page+2",
                "https://web.archive.org/web/20180331152145/https://www.usnews.com/best-graduate-schools/top-law-schools/part-time-law-rankings/page+3"
              ],
              2017 => [
                "https://web.archive.org/web/20171230030143/https://www.usnews.com/best-graduate-schools/top-law-schools/part-time-law-rankings",
                "https://web.archive.org/web/20171230030144/https://www.usnews.com/best-graduate-schools/top-law-schools/part-time-law-rankings/page+2",
                "https://web.archive.org/web/20171230034623/https://www.usnews.com/best-graduate-schools/top-law-schools/part-time-law-rankings/page+3"
              ],
              2016 => [
                "https://web.archive.org/web/20160922005609/http://grad-schools.usnews.rankingsandreviews.com:80/best-graduate-schools/top-law-schools/part-time-law-rankings",
                "https://web.archive.org/web/20160625141127/http://grad-schools.usnews.rankingsandreviews.com/best-graduate-schools/top-law-schools/part-time-law-rankings/page+2",
                "https://web.archive.org/web/20160906082556/http://grad-schools.usnews.rankingsandreviews.com:80/best-graduate-schools/top-law-schools/part-time-law-rankings/page+3"
              ],
              2015 => [
                "https://web.archive.org/web/20150919115015/http://grad-schools.usnews.rankingsandreviews.com:80/best-graduate-schools/top-law-schools/part-time-law-rankings",
                "https://web.archive.org/web/20150905082948/http://grad-schools.usnews.rankingsandreviews.com/best-graduate-schools/top-law-schools/part-time-law-rankings/page+2",
                "https://web.archive.org/web/20150905110701/http://grad-schools.usnews.rankingsandreviews.com/best-graduate-schools/top-law-schools/part-time-law-rankings/page+3"
              ],
              2014 => [
                "https://web.archive.org/web/20140914040402/http://grad-schools.usnews.rankingsandreviews.com:80/best-graduate-schools/top-law-schools/part-time-law-rankings",
                "https://web.archive.org/web/20141005184533/http://grad-schools.usnews.rankingsandreviews.com:80/best-graduate-schools/top-law-schools/part-time-law-rankings/page+2",
                "https://web.archive.org/web/20140925100655/http://grad-schools.usnews.rankingsandreviews.com:80/best-graduate-schools/top-law-schools/part-time-law-rankings/page+3"
              ],
              2013 => [
                "https://web.archive.org/web/20130731183519/http://grad-schools.usnews.rankingsandreviews.com/best-graduate-schools/top-law-schools/part-time-law-rankings",
                "https://web.archive.org/web/20130715001259/http://grad-schools.usnews.rankingsandreviews.com:80/best-graduate-schools/top-law-schools/part-time-law-rankings/page+2",
                "https://web.archive.org/web/20130716001615/http://grad-schools.usnews.rankingsandreviews.com:80/best-graduate-schools/top-law-schools/part-time-law-rankings/page+3"
              ],
              2012 => [
                "https://web.archive.org/web/20120722043756/http://grad-schools.usnews.rankingsandreviews.com:80/best-graduate-schools/top-law-schools/part-time-law-rankings",
                "https://web.archive.org/web/20120531162244/http://grad-schools.usnews.rankingsandreviews.com:80/best-graduate-schools/top-law-schools/part-time-law-rankings/page+2",
                "https://web.archive.org/web/20120606144051/http://grad-schools.usnews.rankingsandreviews.com/best-graduate-schools/top-law-schools/part-time-law-rankings/page+3"
              ]
            }
          end
        end
      end
    end
  end
end
