RSpec.describe UsNewsRankings::Education::GraduateSchools::LawPartTime::AnnualList do
  describe "#rankings" do
    let(:category){ UsNewsRankings::Education::GraduateSchools::LawPartTime::Category.new }
    let(:annual_list){ described_class.new(category: category, year: year) }

    describe "for 2018" do
      let(:year){ 2018 }

      it "should return a list of ranked schools" do
        expect(annual_list.rankings.count).to eql(25)
      end

      it "should contain the expected rankings" do
        expect(annual_list.rankings.first).to eql({
          :rank=>1,
          :tie=>false,
          :school_name=>"Georgetown University",
          :school_city=>"Washington, DC",
          :score=>"100",
          :peer_score=>"4.2", # out of 5
          :lsat_25th=>"157",
          :lsat_75th=>"167",
          :acceptance_rate=>"6%",
          :enrollment=>"232"
        })
      end
    end


  end
end
