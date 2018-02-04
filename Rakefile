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
    page = UsNewsRankings::Page.new(html_filepath)
    puts "...skipping" unless page.parse
  end
end

task :transform_tables do
  table_files = Dir.glob("web/rankings/education/**/*table*.html")
  puts "EXTRACTING RANKINGS DATA FROM #{table_files.count} HTML TABLES"

  table_files.each do |table_filepath|
    puts table_filepath
    table = UsNewsRankings::Table.new(table_filepath)
    table.parse
  end
end
