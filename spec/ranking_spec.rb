RSpec.describe UsNewsRankings::Ranking do
  describe "#ranked?" do
    let(:ranking){ described_class.new(year: nil, row:nil) }
    let(:nonranking){ described_class.new(year: nil, row:nil) }

    before(:each) do
      allow(ranking).to receive(:rank).and_return(125)
      allow(nonranking).to receive(:rank).and_return("Not Ranked")
    end

    it "only includes numeric rankings" do
      expect(ranking.ranked?).to eql(true)
      expect(nonranking.ranked?).to eql(false)
    end
  end

  describe "instance methods expected to be defined in the child class" do
    let(:ranking){ described_class.new(year: nil, row:nil) }

    describe "#rank" do
      it "should raise an error" do
        expect{ranking.rank}.to raise_error("Oh, please implement #rank in the child class.")
      end
    end

    describe "#tie?" do
      it "should raise an error" do
        expect{ranking.tie?}.to raise_error("Oh, please implement #tie? in the child class.")
      end
    end

    describe "#to_h" do
      it "should raise an error" do
        expect{ranking.to_h}.to raise_error("Oh, please implement #to_h in the child class.")
      end
    end
  end
end
