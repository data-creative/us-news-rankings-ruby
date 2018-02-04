require "bundler/gem_tasks"
require "rspec/core/rake_task"

require_relative "./lib/us_news_rankings"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :extract_tables do
  html_files = Dir.glob("web/rankings/education/**/*page*.html") # Dir.glob("web/rankings/**/*.html")
  puts "EXTRACTING RANKINGS TABLES FROM #{html_files.count} HTML PAGES"

  html_files.each do |html_filepath|
    puts html_filepath

    begin
      page = UsNewsRankings::Page.new(html_filepath)
      page.parse
    rescue UsNewsRankings::Page::InvalidTableError
      puts "...skipping"
    end
  end
end
