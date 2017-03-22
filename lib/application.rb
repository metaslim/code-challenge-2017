require_relative 'loader/loader_pack'
require_relative 'presenter/presenter_pack'
require_relative 'report/report'

class Application

	class << self
		def cli(responses_csv, survey_csv)
    	# Your implementation probably starts here...
			questions = QuestionsLoader.load_from(survey_csv)
			responses = ResponsesLoader.load_from(responses_csv)

			report = Report.new(questions, responses)
			report.add_presenter(ParticipationPercentage.new)
			report.add_presenter(TotalParticipant.new)
			report.add_presenter(RatingAverage.new)
			report.add_presenter(SingleSelection.new)

			report.build
			report.flush

			
  	end
	end
end