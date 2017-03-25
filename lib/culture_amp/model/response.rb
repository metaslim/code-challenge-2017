module CultureAmp
	module Model
		class Response
			attr_reader :employee, :answers, :timestamp

			def initialize(employee, answers, timestamp)
				@employee = employee
				@answers = answers
				@timestamp = timestamp
			end

			def is_submitted?
				!timestamp.nil?
			end
		end
	end
end