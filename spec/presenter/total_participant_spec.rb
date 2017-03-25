require_relative '../spec_helper'
require_relative '../../lib/culture_amp/report/base_report'
require_relative '../../lib/culture_amp/presenter/total_participant'


describe "total_participant presenter" do
  let(:questions) { build_list(:question, 5) }
  let(:responses) { build_list(:response, 5) }
  let(:report) { CultureAmp::Report::BaseReport.new(questions, responses) }

  describe "result" do
    it "shows correct total participant" do
      expect(report.add_presenter(CultureAmp::Presenter::TotalParticipant.new).build).to include('The total participant', '5')
    end
  end
end
