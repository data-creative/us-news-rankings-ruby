RSpec.describe UsNewsRankings::Client do
  describe "#rankings" do
    let(:category){ UsNewsRankings::Education::GraduateSchools::Law::Category }
    let(:client){ described_class.new(category: category, year: 2017) }

    it "returns a corresponding list of ranked schools" do
      expect(client.rankings).to_not be_empty
    end
  end
end
