require_relative 'loader/loader_pack'

class Application

	class << self
		def cli(responses_csv, survey_csv)
			questions = QuestionsLoader.load_from(survey_csv)
			responses = ResponsesLoader.load_from(responses_csv)

			#puts questions.inspect
			puts responses.inspect

    	# Your implementation probably starts here...
  	end
	end
end