RSpec.describe UsNewsRankings::Education::GraduateSchools::LawPartTime::AnnualList do
  describe "#rankings" do
    let(:category){ UsNewsRankings::Education::GraduateSchools::LawClinical::Category.new }
    let(:annual_list){ described_class.new(category: category, year: 2017) }

    it "should return a list of ranked schools" do
      expect(annual_list.rankings).to_not be_empty
    end
  end
end
