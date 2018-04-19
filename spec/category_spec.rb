RSpec.describe UsNewsRankings::Category do
  describe "#source_urls" do
    let(:category){ described_class.new }

    it "should be implemented in a child class" do
      expect{category.source_urls}.to raise_error("Oh, please implement #source_urls on the child class.")
    end
  end
end
