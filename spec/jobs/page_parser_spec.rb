RSpec.describe UsNewsRankings::PageParser, type: :job do
  describe "#perform" do
    context "when parsing a valid page" do
      let(:page_filepath){ "spec/mocks/pages/rankings_page.html" }
      let(:temp_page_filepath){ "spec/mocks/pages/temp_rankings_page.html" }
      let(:temp_table_filepath){ "spec/mocks/pages/temp_rankings_table.html" }
      let(:page){ UsNewsRankings::Page.new(temp_page_filepath)}
      let(:job){ described_class.new(page) }
      let(:result){ job.perform }

      before(:each) do
        FileUtils.rm_f(temp_table_filepath) # ensure the temp table has been removed before the job performance so we can test for its presence later.
        FileUtils.cp(page_filepath, temp_page_filepath)
        result
      end

      after(:each) do
        FileUtils.rm_f(temp_page_filepath)
        FileUtils.rm_f(temp_table_filepath)
      end

      it "should extract the rankings table" do
        expect(page.table_filepath).to eql(temp_table_filepath)
        expect(File.exist?(page.table_filepath)).to eql(true)
      end

      it "should clean up after itself" do
        expect(page.filepath).to eql(temp_page_filepath)
        expect(File.exist?(page.filepath)).to eql(false)
      end

      it "should return true" do
        expect(result).to eql(true)
      end
    end

    context "when parsing an invalid page" do
      let(:page_path){ "./spec/mocks/pages/invalid_page.html" }
      let(:page){ UsNewsRankings::Page.new(page_path) }

      it "should return false" do
        expect(described_class.new(page).perform).to eql(false)
      end
    end
  end
end
