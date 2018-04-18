RSpec.describe UsNewsRankings::Education::GraduateSchools::Law::AnnualList do
  describe "#rankings" do
    let(:category){ UsNewsRankings::Education::GraduateSchools::Law::Category.new }
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
          :school_name=>"Yale University",
          :school_city=>"New Haven, CT",
          :tuition=>"$62,170 (full-time)",
          :enrollment=>"625"
        })
      end
    end

    describe "for 2017" do
      let(:year){ 2017 }

      it "should return a list of ranked schools" do
        expect(annual_list.rankings.count).to eql(25)
      end

      it "should contain the expected rankings" do
        expect(annual_list.rankings.first).to eql({
          :rank=>1,
          :tie=>false,
          :school_name=>"Yale University",
          :school_city=>"New Haven, CT",
          :tuition=>"$59,865 per year (full-time)",
          :enrollment=>"632"
        })
      end
    end



  end
end
