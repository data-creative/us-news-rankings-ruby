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
  #table_files = Dir.glob("web/rankings/education/**/*table*.html")
  #puts "EXTRACTING RANKINGS DATA FROM #{table_files.count} HTML TABLES"

  #dirs = table_files.map{|filepath|
  #  filepath.split("/")[0..5].join("/") #> "web/rankings/education/colleges/business/2017"
  #}.uniq

  dirs = (2012..2017).to_a.map{|rankings_year| "web/rankings/education/grad-schools/law-part-time/#{rankings_year}" }

  puts "EXTRACTING RANKINGS DATA FROM #{dirs.count} DIRECTORIES"

  dirs.each do |tables_dir|
    parser = UsNewsRankings::TableParser.new(tables_dir)
    begin
      parser.perform
    rescue => e
      puts "... SKIPPING (#{e})"
    end
  end
end
