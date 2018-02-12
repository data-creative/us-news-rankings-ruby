RSpec.describe UsNewsRankings::Category do
  describe "#source_urls" do
    let(:category){ described_class.new(2017) }

    it "should be implemented in a child class" do
      expect{category.source_urls}.to raise_error("Oh, please implement #source_urls on the child class.")
    end
  end

  describe "#html_dir" do
    let(:category){ described_class.new(2017) }

    it "should be implemented in a child class" do
      expect{category.html_dir}.to raise_error("Oh, please implement #html_dir on the child class.")
    end
  end
end
