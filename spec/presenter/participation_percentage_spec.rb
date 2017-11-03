require_relative '../spec_helper'
require_relative '../../lib/culture_amp/report/base_report'
require_relative '../../lib/culture_amp/presenter/participation_percentage'


describe "participation_percentage presenter" do
  let(:questions) { build_list(:question, 5) }
  let(:responses) { build_list(:response, 5) }
  let(:report) { CultureAmp::Report::BaseReport.new(questions, responses) }

  describe "result" do
    it "shows correct participation percentage" do
      expect(report.add_presenter(CultureAmp::Presenter::ParticipationPercentage.new).build).to include('The participation percentage', '100%')
     end

     it "shows correct participation percentage with unsubmitted response" do
      unsubmitted_response = build_list(:unsubmitted_response, 5)
      report = CultureAmp::Report::BaseReport.new(questions, unsubmitted_response)
      expect(report.add_presenter(CultureAmp::Presenter::ParticipationPercentage.new).build).to include('The participation percentage', '0%')
     end
  end
end
