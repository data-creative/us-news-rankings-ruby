RSpec.describe UsNewsRankings::Education::GraduateSchools::LawClinical::Category do
  describe "#pages" do
    let(:category){ described_class.new(2017) }

    it "should return a list of page objects representing source content" do
      expect(category.pages.count).to eql(1)
    end
  end

  describe "#rankings" do
    describe "for 2017" do
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

    describe "for 2016" do
      let(:category){ described_class.new(2016) }

      it "should return a list of ranked schools" do
        expect(category.rankings.count).to eql(11)
      end

      it "should contain the expected rankings" do
        expect(category.rankings.first).to eql({
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
      let(:category){ described_class.new(2015) }

      it "should return a list of ranked schools" do
        expect(category.rankings.count).to eql(12)
      end

      it "should contain the expected rankings" do
        expect(category.rankings.first).to eql({
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
      let(:category){ described_class.new(2014) }

      it "should return a list of ranked schools" do
        expect(category.rankings.count).to eql(11)
      end

      it "should contain the expected rankings" do
        expect(category.rankings.first).to eql({
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
      let(:category){ described_class.new(2013) }

      it "should return a list of ranked schools" do
        expect(category.rankings.count).to eql(11)
      end

      it "should contain the expected rankings" do
        expect(category.rankings.first).to eql({
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
      let(:category){ described_class.new(2012) }

      it "should return a list of ranked schools" do
        expect(category.rankings.count).to eql(11)
      end

      it "should contain the expected rankings" do
        expect(category.rankings.first).to eql({
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
