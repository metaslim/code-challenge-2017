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
		self
	end

	def build
		presenters.each do |presenter|
			presenter.decorate(self)
		end
		flush
	end

	def append(new_output)
		output << new_output
	end

	private
	def flush
		puts output.join("\n")
	end

end