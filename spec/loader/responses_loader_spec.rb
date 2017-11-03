require_relative '../../lib/culture_amp/loader/responses_loader'


describe "responses_loader" do
  let(:response_csv) {
    <<-CSV
      employee1@abc.xyz,1,2014-07-28T20:35:41+00:00,5,5,5,4,Sally
      employee2@abc.xyz,2,2014-07-29T07:05:41+00:00,4,5,5,3,Jane
      employee3@abc.xyz,3,2014-07-29T17:35:41+00:00,5,5,5,5,John
      employee4@abc.xyz,4,,5,5,5,4,Bob
      employee5@abc.xyz,5,2014-07-31T11:35:41+00:00,4,5,5,2,Mary
    CSV
  }

  let(:responses) { CultureAmp::Loader::ResponsesLoader.load_from(response_csv) }

  describe "result" do
    it "has 5 response" do
      expect(responses.size).to eq 5
    end

    it "has email, id, timestamp, type, answers" do
      expect(responses.first.employee.email.strip).to eq('employee1@abc.xyz')
      expect(responses.first.employee.id).to eq('1')
      expect(responses.first.answers).to eq ["5", "5", "5", "4", "Sally"]
      expect(responses.first.timestamp).to eq('2014-07-28T20:35:41+00:00')
    end

    it "Raise error for bad csv" do
     expect { CultureAmp::Loader::ResponsesLoader.load_from(nil) }.to raise_error ArgumentError
    end
  end

end
