RSpec.describe UsNewsRankings do
  it "has a version number" do
    expect(UsNewsRankings::VERSION).not_to be nil
  end

  describe "rankings lists" do
    it "includes clinical law rankings" do
      rankings_list = UsNewsRankings::Education::GraduateSchools::LawClinical.new(2017)
      rankings = rankings_list.rankings
      expect(rankings).to_not be_empty
    end

    it "includes part-time law rankings" do
      rankings_list = UsNewsRankings::Education::GraduateSchools::LawPartTime.new(2017)
      rankings = rankings_list.rankings
      expect(rankings).to_not be_empty
    end

    it "includes law rankings" do
      rankings_list = UsNewsRankings::Education::GraduateSchools::Law.new(2017)
      rankings = rankings_list.rankings
      expect(rankings).to_not be_empty
    end
  end
end
