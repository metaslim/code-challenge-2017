require_relative 'presenter'

class SingleSelection < Presenter	
	def style
		questions_for('singleselect').map do |question|
			answers = answers_for(question)
			"#{question.text} are #{answers.join(", ")}"
		end
	end 
end