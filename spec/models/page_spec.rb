RSpec.describe UsNewsRankings::Page, type: :model do
  describe "validations" do
    describe "validates_rankings_table" do
      context "when page doesn't contain an expected table" do
        let(:invalid_page_path){ "./spec/mocks/pages/invalid_page.html" }
        let(:invalid_page){ described_class.new(invalid_page_path)}

        it "should return false" do
          expect(invalid_page.valid?).to eql(false)
        end
      end

      context "when page contains the expected table" do
        let(:page_paths){
          [
            "./spec/mocks/pages/flex_page.html",
            "./spec/mocks/pages/rankings_page.html",
            "./spec/mocks/pages/search_results_page.html"
          ]
        }

        it "should return true" do
          page_paths.each do |page_path|
            page = described_class.new(page_path)
            expect(page.valid?).to eql(true)
          end
        end
      end
    end
  end

  describe "#table_filepath" do
    let(:page_path){ "my/pages/path/to/rankings_page123.html" }
    let(:page){ described_class.new(page_path) }

    it "should replace 'page' with 'table', in the filename only" do
      expect(page.table_filepath).to eql("my/pages/path/to/rankings_table123.html")
    end
  end
end
