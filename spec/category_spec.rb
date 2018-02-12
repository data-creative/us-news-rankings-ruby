RSpec.describe UsNewsRankings::Category do
  describe "#rankings" do
    let(:category){ described_class.new(2017) }

    it "should be implemented in a child class" do
      expect{category.rankings}.to raise_error("please implement #rankings on the child class")
    end
  end
end
