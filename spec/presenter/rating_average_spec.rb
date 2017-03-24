require_relative '../spec_helper'
require_relative '../../lib/report/report'
require_relative '../../lib/presenter/rating_average'


describe "rating_average presenter" do
  let(:questions) { build_list(:question, 5) }
  let(:responses) { build_list(:response, 5) }
  let(:report) { Report.new(questions, responses) }

  describe "result" do
    it "shows correct rating average" do
      expect(report.add_presenter(RatingAverage.new).build).to include('Rating for', '5.0')
    end
  end
end
