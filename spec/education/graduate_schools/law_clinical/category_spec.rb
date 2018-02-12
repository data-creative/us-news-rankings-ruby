RSpec.describe UsNewsRankings::Education::GraduateSchools::LawClinical::Category do
  describe "#pages" do
    let(:category){ described_class.new(2017) }

    it "should return a list of page objects representing source content" do
      expect(category.pages.count).to eql(1)
    end
  end

  describe "#rankings" do
    let(:category){ described_class.new(2017) }

    it "should return a list of ranked schools" do
      expect(category.rankings.count).to eql(11)
    end

    it "should contain the expected rankings" do
      expect(category.rankings.first).to eql({
        :rank=>1,
        :tie=>false,
        :school_name=>"Georgetown University",
        :school_city=>"Washington, DC",
        :tuition=>"$57,576 per year (full-time)",
        :enrollment=>"1,721"
      })
    end
  end
end
