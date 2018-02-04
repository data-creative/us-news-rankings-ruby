module UsNewsRankings
  class PageParser
    attr_reader :page

    # @param [UsNewsRankings::Page] page
    def initialize(page)
      @page = page
    end

    def perform
      FileUtils.rm_rf(table_filepath)

      File.open(table_filepath, 'w') do |file|
        file.write(table.to_xhtml(indent: 2))
      end

      FileUtils.rm_rf(page.filepath)
    end

    def table_filepath
      page.table_filepath
    end

    def table
      page.table
    end
  end
end
