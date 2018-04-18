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

    describe "for 2017" do
      let(:year){ 2017 }

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
          :lsat_75th=>"168",
          :acceptance_rate=>"5.8%",
          :enrollment=>"242"
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
          :school_name=>"Georgetown University",
          :school_city=>"Washington, DC",
          :score=>"100",
          :peer_score=>"4.1", # out of 5
          :lsat_25th=>"160",
          :lsat_75th=>"167",
          :acceptance_rate=>"5.1%",
          :enrollment=>"241"
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
          :school_name=>"Georgetown University",
          :school_city=>"Washington, DC",
          :score=>"100",
          :peer_score=>"4.0", # out of 5
          :lsat_25th=>"160",
          :lsat_75th=>"168",
          :acceptance_rate=>"4.9%",
          :enrollment=>"247"
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
          :school_name=>"Georgetown University",
          :school_city=>"Washington, DC",
          :score=>"100",
          :peer_score=>"4.1",
          :lsat_25th=>"158",
          :lsat_75th=>"165",
          :acceptance_rate=>"4.5%",
          :enrollment=>"239"
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
          :school_name=>"Georgetown University",
          :school_city=>"Washington, DC",
          :score=>"100",
          :peer_score=>"4.1",
          :lsat_25th=>"163",
          :lsat_75th=>"170",
          :acceptance_rate=>"4.9%",
          :enrollment=>"243"
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
          :school_name=>"Georgetown University",
          :school_city=>"Washington, DC",
          :score=>"100",
          :peer_score=>"4.3", # out of 5
          :lsat_25th=>"163",
          :lsat_75th=>"170",
          :acceptance_rate=>"7.8%",
          :enrollment=>"261"
        })
      end
    end


  end
end
