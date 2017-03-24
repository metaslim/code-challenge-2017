require_relative '../spec_helper'
require_relative '../../lib/report/report'
require_relative '../../lib/presenter/single_selection'


describe "single_selection presenter" do
  let(:questions) { build_list(:single_question, 1) }
  let(:responses) { build_list(:single_question_response, 1) }
  let(:report) { Report.new(questions, responses) }

  describe "result" do
    it "shows correct answer" do
      expect(report.add_presenter(SingleSelection.new).build).to include('Mary')
    end
  end
end
