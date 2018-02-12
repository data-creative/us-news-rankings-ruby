RSpec.describe UsNewsRankings::Education::GraduateSchools::LawPartTime do
  describe "#rankings" do
    let(:category){ described_class.new(2017) }

    it "should return a list of ranked schools" do
      expect(category.rankings).to_not be_empty
    end
  end
end
