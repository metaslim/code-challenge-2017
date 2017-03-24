require_relative '../spec_helper'
require_relative '../../lib/report/report'
require_relative '../../lib/presenter/presenter'


describe "report" do
	def report
		@report
	end

  let(:questions) { build_list(:question, 5) }
  let(:responses) { build_list(:response, 5) }

  before do
		@report = Report.new(questions, responses)
  end

  describe "result" do
    it "has correct questions" do
      expect(report.questions).to eq questions
    end

    it "has correct responses" do
      expect(report.responses).to eq responses
    end

    it "append content to ouput correctly" do
      content = "Total is 5"
      expect(report.append(content)).to include content
    end

    it "add new presenter" do
      presenter = instance_double("Presenter", :style => "Logic")
      report.add_presenter(presenter)
      expect(report.presenters.first.style).to eq "Logic"
    end

    it "build correct ouput" do
      presenter = Presenter.new
      allow(presenter).to receive(:style).and_return("my style 1")
      presenter2 = Presenter.new
      allow(presenter2).to receive(:style).and_return("my style 2")

      report.add_presenter(presenter)
      report.add_presenter(presenter2)
      expect(report.build).to eq "my style 1\nmy style 2"
    end
  end
end
