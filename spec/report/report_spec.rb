require_relative '../spec_helper'
require_relative '../../lib/culture_amp/report/base_report'
require_relative '../../lib/culture_amp/presenter/base_presenter'


describe "report" do
  let(:questions) { build_list(:question, 5) }
  let(:responses) { build_list(:response, 5) }

  let(:report) { CultureAmp::Report::BaseReport.new(questions, responses) }

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
      presenter = CultureAmp::Presenter::BasePresenter.new
      allow(presenter).to receive(:style).and_return("Style 1")
      presenter2 = CultureAmp::Presenter::BasePresenter.new
      allow(presenter2).to receive(:style).and_return("Style 2")

      report.add_presenter(presenter)
      report.add_presenter(presenter2)
      expect(report.build).to eq "Style 1\nStyle 2"
    end
  end
end
