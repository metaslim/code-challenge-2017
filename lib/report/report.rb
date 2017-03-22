class Report
	attr_reader :presenters, :output, :questions, :responses

	def initialize(questions, responses)
		@questions = questions
		@responses = responses
		@presenters = []
		@output = []
	end

	def add_presenter(presenter)
		@presenters << presenter
	end

	def build
		presenters.each do |presenter|
			presenter.decorate(self)
		end
	end

	def flush
		puts output.join("\n")
	end

	def append(new_output)
		output << new_output
	end

end