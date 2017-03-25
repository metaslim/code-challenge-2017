module CultureAmp
	module Report
		class BaseReport
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
				output.join("\n")
			end

			def append(content)
				output << content
			end
		end
	end
end