RSpec.describe UsNewsRankings::TableParser, type: :job do
  describe "#perform" do
    let(:tables_dir){ "./spec/mocks/tables/my_list/2017" }
    let(:data_dir){ "./spec/mocks/data/my_list" }
    let(:json_filepath){ "#{data_dir}/2017.json" }
    let(:csv_filepath){ "#{data_dir}/2017.csv" }
    let(:job){ described_class.new(tables_dir) }

    before(:each) do
      job.remove_data_files
      allow(job).to receive(:data_dir).and_return(data_dir)
      job.perform
    end

    # NOTE: keeping this commented-out for now so I can examine the output files
    #after(:each) do
    #  job.remove_data_files
    #end

    it "should extract rankings data from multiple tables" do
      expect(csv_filepath).to eql(job.csv_filepath)
      expect(File.exist?(csv_filepath)).to eql(true)

      expect(json_filepath).to eql(json_filepath)
      expect(File.exist?(json_filepath)).to eql(true)
    end
  end
end
