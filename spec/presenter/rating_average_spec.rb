require_relative '../spec_helper'
require_relative '../../lib/culture_amp/report/base_report'
require_relative '../../lib/culture_amp/presenter/rating_average'


describe "rating_average presenter" do
  let(:questions) { build_list(:question, 5) }
  let(:responses) { build_list(:response, 5) }
  let(:report) { CultureAmp::Report::BaseReport.new(questions, responses) }

  describe "result" do
    it "shows correct rating average" do
      expect(report.add_presenter(CultureAmp::Presenter::RatingAverage.new).build).to include('Rating for', '5.0')
    end
  end
end
