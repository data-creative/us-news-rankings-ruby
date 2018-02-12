RSpec.describe UsNewsRankings::Client do
  describe "#rankings" do
    let(:category_namespace){ "education/graduate_schools/law_clinical" }
    let(:client){ described_class.new(category: category_namespace, year: 2017) }

    it "returns a corresponding list of ranked schools" do
      expect(client.rankings).to_not be_empty
    end
  end
end
