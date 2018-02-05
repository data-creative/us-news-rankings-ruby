require "pry"

require "us_news_rankings/models/page"
#require "us_news_rankings/models/pages/flex_page"
#require "us_news_rankings/models/pages/rankings_data_page"
#require "us_news_rankings/models/pages/search_results_page"
require "us_news_rankings/models/ranking"
require "us_news_rankings/jobs/page_parser"
require "us_news_rankings/jobs/table_parser"
require "us_news_rankings/version"

module UsNewsRankings
  # A non-comprehensive list of rankings lists,
  # ... each of which should match a corresponding directory path in the archives repository,
  # ... each of which should contain one or more sub-directories named after the rankings year,
  # ... each of which should contain one or more HTML files representing rankings pages or tables.
  # ... (e.g. "web/rankings/education/grad-schools/law-part-time/2016/table1.html")
  LISTS = [
    "education/colleges/business",
    "education/colleges/engineering-doctorate",
    "education/colleges/hbcu",
    "education/colleges/liberal-arts",
    "education/colleges/national-universities",
    "education/grad-schools/business",
    "education/grad-schools/business-part-time",
    "education/grad-schools/education",
    "education/grad-schools/engineering",
    "education/grad-schools/fine-arts",
    "education/grad-schools/law",
    "education/grad-schools/law-clinical",
    "education/grad-schools/law-part-time",
    "education/grad-schools/library",
    "education/grad-schools/medical",
    "education/grad-schools/medical-research",
    "education/grad-schools/nursing-doctoral",
    "education/grad-schools/nursing-masters",
    "education/grad-schools/public-affairs"
   ]
end
