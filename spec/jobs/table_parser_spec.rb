RSpec.describe UsNewsRankings::TableParser, type: :job do
  describe "#perform" do
    let(:rankings_list){ "education/grad-school/law-part-time" }
    let(:tables_dir){ "./spec/mocks/tables/my_list/2017" }
    let(:data_dir){ "./spec/mocks/data/my_list" }
    let(:json_filepath){ "#{data_dir}/2017.json" }
    let(:csv_filepath){ "#{data_dir}/2017.csv" }
    let(:job){ described_class.new(tables_dir) }

    before(:each) do
      job.remove_data_files
      allow(job).to receive(:data_dir).and_return(data_dir)
      allow(job).to receive(:rankings_list).and_return(rankings_list)
      job.perform
    end

    # NOTE: keeping this commented-out for now so I can examine the output files
    #after(:each) do
    #  job.remove_data_files
    #end

    it "should extract rankings data in CSV and JSON format from multiple tables" do
      expect(csv_filepath).to eql(job.csv_filepath)
      expect(File.exist?(csv_filepath)).to eql(true)

      expect(json_filepath).to eql(json_filepath)
      expect(File.exist?(json_filepath)).to eql(true)
    end

    describe "CSV data" do
      let(:csv_file){ CSV.read(csv_filepath, headers: true) }

      it "should have a row per ranked school" do
        expect(csv_file.count).to eql(62)
      end

      it "should contain the expected rankings" do
        expect(csv_file.entries.first.to_h).to eql({
          "rankings_list"=>"education/grad-school/law-part-time",
          "rankings_year"=>"2017",
          "school_name"=>"Georgetown University",
          "school_city"=>"Washington, DC",
          "rank"=>"1",
          "tie"=>"false",
          "score"=>"100",
          "peer_score"=>"4.2",
          "lsat_25th"=>"157",
          "lsat_75th"=>"168",
          "acceptance_rate"=>"0.058",
          "enrollment"=>"242"
        })
      end
    end

    describe "JSON data" do
      let(:json_file){ File.read(json_filepath) }
      let(:rankings_json){ JSON.parse(json_file) }

      it "should contain metadata" do
        expect(rankings_json["rankings_list"]).to eql(rankings_list)
        expect(rankings_json["rankings_year"]).to eql(2017)
      end

      it "should contain a rankings array with an object per school" do
        expect(rankings_json.keys.include?("rankings")).to eql(true)
        expect(rankings_json["rankings"].count).to eql(62)
      end

      it "should contain the expected rankings" do
        expect(rankings_json["rankings"].first).to eql({
          "school_name"=>"Georgetown University",
          "school_city"=>"Washington, DC",
          "rank"=>1,
          "tie"=>false,
          "score"=>100,
          "peer_score"=>4.2,
          "lsat_25th"=>157,
          "lsat_75th"=>168,
          "acceptance_rate"=>0.058,
          "enrollment"=>242
        })
      end
    end
  end
end
