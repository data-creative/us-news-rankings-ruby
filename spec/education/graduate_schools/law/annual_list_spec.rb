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

    describe "for 2016" do
      let(:year){ 2016 }

      it "should return a list of ranked schools" do
        expect(annual_list.rankings.count).to eql(25)
      end

      it "should contain the expected rankings" do
        expect(annual_list.rankings.first).to eql({
          :rank=>1,
          :tie=>false,
          :school_name=>"Yale University",
          :school_city=>"New Haven, CT",
          :tuition=>"$58,050 per year (full-time)",
          :enrollment=>"614"
        })
      end
    end

    describe "for 2015" do
      let(:year){ 2015 }

      it "should return a list of ranked schools" do
        expect(annual_list.rankings.count).to eql(25)
      end

      it "should contain the expected rankings" do
        expect(annual_list.rankings.first).to eql({
          :rank=>1,
          :tie=>false,
          :school_name=>"Yale University",
          :school_city=>"New Haven, CT",
          :tuition=>"$56,200 per year (full-time)",
          :enrollment=>"607"
        })
      end
    end

    describe "for 2014" do
      let(:year){ 2014 }

      it "should return a list of ranked schools" do
        expect(annual_list.rankings.count).to eql(25)
      end

      it "should contain the expected rankings" do
        expect(annual_list.rankings.first).to eql({
          :rank=>1,
          :tie=>false,
          :school_name=>"Yale University",
          :school_city=>"New Haven, CT",
          :tuition=>"$54,650 per year (full-time)",
          :enrollment=>"625"
        })
      end
    end

    describe "for 2013" do
      let(:year){ 2013 }

      it "should return a list of ranked schools" do
        expect(annual_list.rankings.count).to eql(25)
      end

      it "should contain the expected rankings" do
        expect(annual_list.rankings.first).to eql({
          :rank=>1,
          :tie=>false,
          :school_name=>"Yale University",
          :school_city=>"New Haven, CT",
          :tuition=>"$53,600 per year (full-time)",
          :enrollment=>"615"
        })
      end
    end

    describe "for 2012" do
      let(:year){ 2012 }

      it "should return a list of ranked schools" do
        expect(annual_list.rankings.count).to eql(25)
      end

      it "should contain the expected rankings" do
        expect(annual_list.rankings.first).to eql({
          :rank=>1,
          :tie=>false,
          :school_name=>"Yale University",
          :school_city=>"New Haven, CT",
          :tuition=>"Full-time: $52,525 per year",
          :enrollment=>"638"
        })
      end
    end

    describe "for 2011" do
      let(:year){ 2011 }

      it "should return a list of ranked schools" do
        expect(annual_list.rankings.count).to eql(25)
      end

      it "should contain the expected rankings" do
        expect(annual_list.rankings.first).to eql({
          :rank=>1,
          :tie=>false,
          :school_name=>"Yale University",
          :school_city=>"New Haven, CT",
          :tuition=>"Full-time: $50,750 per year",
          :enrollment=>"629" #,
          #:lsat_25th=>"171",
          #:lsat_75th=>"176"
        })
      end
    end


  end
end
