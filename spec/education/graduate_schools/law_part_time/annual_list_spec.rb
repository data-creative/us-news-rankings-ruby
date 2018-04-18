RSpec.describe UsNewsRankings::Education::GraduateSchools::LawPartTime::AnnualList do
  describe "#rankings" do
    let(:annual_list){ described_class.new(year) }

    describe "for 2018" do
      let(:year){ 2018 }

      it "should return a list of ranked schools" do
        expect(annual_list.rankings.count).to eql(56)
        expect(annual_list.pages.count).to eql(3)
      end

      it "should contain the expected rankings" do
        expect(annual_list.rankings.first).to eql({
          :rank=>1,
          :tie=>false,
          :school_name=>"Georgetown University",
          :school_city=>"Washington, DC",
          :score=>"100",
          :peer_score=>"4.2",
          :lsat_25th=>"157",
          :lsat_75th=>"167",
          :acceptance_rate=>"6%",
          :enrollment=>"232"
        })

        expect(annual_list.rankings[25]).to eql({
          :rank=>26,
          :tie=>false,
          :school_name=>"Marquette University",
          :school_city=>"Milwaukee, WI",
          :score=>"46",
          :peer_score=>"2.4",
          :lsat_25th=>"149",
          :lsat_75th=>"156",
          :acceptance_rate=>"26.3%",
          :enrollment=>"57"
        })

        expect(annual_list.rankings[50]).to eql({
          :rank=>50,
          :tie=>true,
          :school_name=>"South Texas College of Law Houston",
          :school_city=>"Houston, TX",
          :score=>"32",
          :peer_score=>"1.9",
          :lsat_25th=>"146",
          :lsat_75th=>"151",
          :acceptance_rate=>"55.6%",
          :enrollment=>"210"
        })
      end
    end

    describe "for 2017" do
      let(:year){ 2017 }

      it "should return a list of ranked schools" do
        expect(annual_list.rankings.count).to eql(62)
        expect(annual_list.pages.count).to eql(3)
      end

      it "should contain the expected rankings" do
        expect(annual_list.rankings.first).to eql({
          :rank=>1,
          :tie=>false,
          :school_name=>"Georgetown University",
          :school_city=>"Washington, DC",
          :score=>"100",
          :peer_score=>"4.2",
          :lsat_25th=>"157",
          :lsat_75th=>"168",
          :acceptance_rate=>"5.8%",
          :enrollment=>"242"
        })

        expect(annual_list.rankings[25]).to eql({
          :rank=>24,
          :tie=>true,
          :school_name=>"Stetson University",
          :school_city=>"Gulfport, FL",
          :score=>"46",
          :peer_score=>"2.1",
          :lsat_25th=>"150",
          :lsat_75th=>"157",
          :acceptance_rate=>"39.6%",
          :enrollment=>"133"
        })

        expect(annual_list.rankings[50]).to eql({
          :rank=>50,
          :tie=>true,
          :school_name=>"University of Akron",
          :school_city=>"Akron, OH",
          :score=>"33",
          :peer_score=>"1.8",
          :lsat_25th=>"149",
          :lsat_75th=>"154",
          :acceptance_rate=>"41.2%",
          :enrollment=>"144"
        })
      end
    end

    describe "for 2016" do
      let(:year){ 2016 }

      it "should return a list of ranked schools" do
        expect(annual_list.rankings.count).to eql(64)
        expect(annual_list.pages.count).to eql(3)
      end

      it "should contain the expected rankings" do
        expect(annual_list.rankings.first).to eql({
          :rank=>1,
          :tie=>false,
          :school_name=>"Georgetown University",
          :school_city=>"Washington, DC",
          :score=>"100",
          :peer_score=>"4.1",
          :lsat_25th=>"160",
          :lsat_75th=>"167",
          :acceptance_rate=>"5.1%",
          :enrollment=>"241"
        })

        expect(annual_list.rankings[25]).to eql({
          :rank=>25,
          :tie=>true,
          :school_name=>"St. Louis University",
          :school_city=>"St. Louis, MO",
          :score=>"48",
          :peer_score=>"2.4",
          :lsat_25th=>"148",
          :lsat_75th=>"157",
          :acceptance_rate=>"57.5%",
          :enrollment=>"77"
        })

        expect(annual_list.rankings[50]).to eql({
          :rank=>50,
          :tie=>true,
          :school_name=>"Widener University",
          :school_city=>"Wilmington, DE",
          :score=>"30",
          :peer_score=>"1.7",
          :lsat_25th=>"147",
          :lsat_75th=>"151",
          :acceptance_rate=>"44.1%",
          :enrollment=>"139"
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
          :peer_score=>"4.0",
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
          :peer_score=>"4.3",
          :lsat_25th=>"163",
          :lsat_75th=>"170",
          :acceptance_rate=>"7.8%",
          :enrollment=>"261"
        })
      end
    end


  end
end
