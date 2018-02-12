RSpec.describe UsNewsRankings::Category do
  describe "#source_urls" do
    let(:category){ described_class.new(2017) }

    it "should be implemented in a child class" do
      expect{category.source_urls}.to raise_error("Oh, please implement #source_urls on the child class.")
    end
  end

  describe "#html_dir" do
    let(:category){ UsNewsRankings::Education::GraduateSchools::LawClinical::Category.new(2017) }

    it "should combine the category namespace with the rankings year" do
      expect(category.html_dir).to eql("./web/education/graduate_schools/law_clinical/2017")
    end
  end
end
