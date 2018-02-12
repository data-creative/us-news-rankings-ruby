RSpec.describe UsNewsRankings::Education::GraduateSchools::LawClinical::AnnualList do
  describe "#rankings" do
    describe "for 2017" do
      let(:category){ UsNewsRankings::Education::GraduateSchools::LawClinical::Category.new }
      let(:annual_list){ described_class.new(category: category, year: 2017) }

      it "should return a list of ranked schools" do
        expect(annual_list.rankings.count).to eql(11)
      end

      it "should contain the expected rankings" do
        expect(annual_list.rankings.first).to eql({
          :rank=>1,
          :tie=>false,
          :school_name=>"Georgetown University",
          :school_city=>"Washington, DC",
          :tuition=>"$57,576 per year (full-time)",
          :enrollment=>"1,721"
        })
      end
    end

    describe "for 2016" do
      let(:category){ UsNewsRankings::Education::GraduateSchools::LawClinical::Category.new }
      let(:annual_list){ described_class.new(category: category, year: 2016) }

      it "should return a list of ranked schools" do
        expect(annual_list.rankings.count).to eql(11)
      end

      it "should contain the expected rankings" do
        expect(annual_list.rankings.first).to eql({
          :rank=>1,
          :tie=>false,
          :school_name=>"Georgetown University",
          :school_city=>"Washington, DC",
          :tuition=>"$55,255 per year (full-time)",
          :enrollment=>"1,725"
        })
      end
    end

    describe "for 2015" do
      let(:category){ UsNewsRankings::Education::GraduateSchools::LawClinical::Category.new }
      let(:annual_list){ described_class.new(category: category, year: 2015) }

      it "should return a list of ranked schools" do
        expect(annual_list.rankings.count).to eql(12)
      end

      it "should contain the expected rankings" do
        expect(annual_list.rankings.first).to eql({
          :rank=>1,
          :tie=>false,
          :school_name=>"Georgetown University",
          :school_city=>"Washington, DC",
          :tuition=>"$53,130 per year (full-time)",
          :enrollment=>"1,719"
        })
      end
    end

    describe "for 2014" do
      let(:category){ UsNewsRankings::Education::GraduateSchools::LawClinical::Category.new }
      let(:annual_list){ described_class.new(category: category, year: 2014) }

      it "should return a list of ranked schools" do
        expect(annual_list.rankings.count).to eql(11)
      end

      it "should contain the expected rankings" do
        expect(annual_list.rankings.first).to eql({
          :rank=>1,
          :tie=>false,
          :school_name=>"Georgetown University",
          :school_city=>"Washington, DC",
          :tuition=>"$50,890 per year (full-time)",
          :enrollment=>"1,694"
        })
      end
    end

    describe "for 2013" do
      let(:category){ UsNewsRankings::Education::GraduateSchools::LawClinical::Category.new }
      let(:annual_list){ described_class.new(category: category, year: 2013) }

      it "should return a list of ranked schools" do
        expect(annual_list.rankings.count).to eql(11)
      end

      it "should contain the expected rankings" do
        expect(annual_list.rankings.first).to eql({
          :rank=>1,
          :tie=>false,
          :school_name=>"Georgetown University",
          :school_city=>"Washington, DC",
          :tuition=>"$48,835 per year (full-time)",
          :enrollment=>"1,683"
        })
      end
    end

    describe "for 2012" do
      let(:category){ UsNewsRankings::Education::GraduateSchools::LawClinical::Category.new }
      let(:annual_list){ described_class.new(category: category, year: 2012) }

      it "should return a list of ranked schools" do
        expect(annual_list.rankings.count).to eql(11)
      end

      it "should contain the expected rankings" do
        expect(annual_list.rankings.first).to eql({
          :rank=>1,
          :tie=>false,
          :school_name=>"Georgetown University",
          :school_city=>"Washington, DC",
          :tuition=>"Full-time: $46,865 per year",
          :enrollment=>"1,671"
        })
      end
    end
  end
end
