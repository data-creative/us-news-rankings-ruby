RSpec.describe UsNewsRankings::AnnualList do
  let(:category){ UsNewsRankings::Education::GraduateSchools::LawClinical::Category.new }
  let(:annual_list){ UsNewsRankings::Education::GraduateSchools::LawClinical::AnnualList.new(2017) }

  describe "#source_urls" do
    before(:each) do
      allow(category).to receive(:source_urls).and_return(
        {
          2017=>["www.google.com/2017", "www.google.com/2017?page=2", "www.google.com/2017?page=3"],
          2016=>["www.google.com/2016", "www.google.com/2016?page=2"]
        }
      )
      allow(annual_list).to receive(:category).and_return(category)
    end

    it "should return an array of urls for the given year" do
      expect(annual_list.source_urls).to match_array(["www.google.com/2017", "www.google.com/2017?page=2", "www.google.com/2017?page=3"])
    end
  end

  describe "#pages" do
    it "should return a list of page objects representing source content" do
      expect(annual_list.pages.count).to eql(1)
    end
  end

  describe "#html_dir" do
    it "should combine the category namespace with the rankings year" do
      expect(annual_list.html_dir).to eql("./web/education/graduate_schools/law_clinical/2017")
    end
  end
end
