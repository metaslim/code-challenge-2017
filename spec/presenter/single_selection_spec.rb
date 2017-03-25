require_relative '../spec_helper'
require_relative '../../lib/culture_amp/report/base_report'
require_relative '../../lib/culture_amp/presenter/single_selection'


describe "single_selection presenter" do
  let(:questions) { build_list(:single_question, 1) }
  let(:responses) { build_list(:single_question_response, 1) }
  let(:report) { CultureAmp::Report::BaseReport.new(questions, responses) }

  describe "result" do
    it "shows correct answer" do
      expect(report.add_presenter(CultureAmp::Presenter::SingleSelection.new).build).to include('Mary')
    end
  end
end
