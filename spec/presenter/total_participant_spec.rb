require_relative '../spec_helper'
require_relative '../../lib/report/report'
require_relative '../../lib/presenter/total_participant'


describe "total_participant" do
  let(:questions) { build_list(:question, 5) }
  let(:responses) { build_list(:response, 5) }
  let(:report) { Report.new(questions, responses) }

  describe "result" do
    it "shows correct total participant" do
      expect(report.add_presenter(TotalParticipant.new).build).to include('The total participant', '5')
    end
  end
end
