class Response
	attr_reader :employee, :answers, :timestamp

	def initialize(employee, answers, timestamp)
		@employee = employee
		@answers = answers
		@timestamp = timestamp
		#@answers = answers.map.with_index do |answer, index|
		#{
		#	Question.get(index) => answer
		#}
		#end
	end

	def is_submitted?
		!timestamp.nil?
	end
end