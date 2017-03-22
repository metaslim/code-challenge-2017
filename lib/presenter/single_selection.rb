require_relative 'presenter'
require_relative 'response_helper'

class SingleSelection < Presenter
	include ResponseHelper
	
	def style
		questions_for('singleselect').map do |question|
			answers = answers_for(question)
			"#{question.text} are #{answers.join(", ")}"
		end
	end 
end