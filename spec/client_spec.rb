RSpec.describe UsNewsRankings::Client do
  describe "#validates_category" do
    let(:client){ described_class.new(category: "education/graduate_schools/law", year: 2017) }
    let(:invalid_client){ described_class.new(category: "abc/123", year: 2017) }

    it "only handles accepted rankings categories" do
      expect{client.validates_category}.to_not raise_error
      expect{invalid_client.validates_category}.to raise_error(described_class::InvalidCategory)
    end
  end
end
