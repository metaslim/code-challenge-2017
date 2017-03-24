require_relative '../spec_helper'
require_relative '../../lib/report/report'
require_relative '../../lib/presenter/participation_percentage'


describe "rating_average" do
  let(:questions) { build_list(:question, 5) }
  let(:responses) { build_list(:response, 5) }
  let(:report) { Report.new(questions, responses) }

  describe "result" do
    it "shows correct participation percentage" do
    	unsubmitted_response = build_list(:response, 5)
    	Report.new(questions, responses)
      expect(report.add_presenter(ParticipationPercentage.new).build).to include('The participation percentage', '100%')
     end

     it "shows correct participation percentage with unsubmitted response" do
    	unsubmitted_response = build_list(:unsubmitted_response, 5)
    	report = Report.new(questions, unsubmitted_response)
      expect(report.add_presenter(ParticipationPercentage.new).build).to include('The participation percentage', '0%')
     end
  end
end
