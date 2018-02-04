RSpec.describe UsNewsRankings::PageParser, type: :job do
  describe "#perform" do
    let(:page_filepath){ "spec/mocks/rankings_page.html" }
    let(:temp_page_filepath){ "spec/mocks/temp_rankings_page.html" }
    let(:temp_table_filepath){ "spec/mocks/temp_rankings_table.html" }
    let(:page){ UsNewsRankings::RankingsDataPage.new(temp_page_filepath)}
    let(:job){ described_class.new(page)}

    before(:each) do
      FileUtils.rm_f(temp_table_filepath) # ensure the temp table has been removed before the job performance so we can test for its presence later.
      FileUtils.cp(page_filepath, temp_page_filepath)
      job.perform
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
  end
end
