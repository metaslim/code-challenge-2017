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
			
			report
			.add_presenter(ParticipationPercentage.new)
			.add_presenter(TotalParticipant.new)
			.add_presenter(RatingAverage.new)
			.add_presenter(SingleSelection.new)

			report.build
			
  	end
	end
end