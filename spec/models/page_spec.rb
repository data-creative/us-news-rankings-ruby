RSpec.describe UsNewsRankings::Page, type: :model do
  describe "validations" do
    describe "validates_rankings_table" do
      context "when page doesn't contain the expected table" do
        let(:invalid_page_path){ "./spec/mocks/invalid_page.html" }
        let(:invalid_page){ described_class.new(invalid_page_path)}

        it "should raise an error" do
          expect{invalid_page}.to raise_error(described_class::InvalidTableError)
        end
      end

      context "when page contains the expected table" do
        let(:page_paths){
          [
            "./spec/mocks/flex_page.html",
            "./spec/mocks/rankings_page.html",
            "./spec/mocks/search_results_page.html"
          ]
        }

        it "should not raise an error" do
          page_paths.each do |page_path|
            page = described_class.new(page_path)
            expect{page}.to_not raise_error
          end
        end
      end
    end
  end
end
