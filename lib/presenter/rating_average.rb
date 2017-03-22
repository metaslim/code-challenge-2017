require_relative 'presenter'
require_relative 'response_helper'

class RatingAverage < Presenter
	include ResponseHelper
	
	def style
		questions_for('ratingquestion').map do |question|
			answers = answers_for(question)
			rating = ((answers.inject(0){|sum,x| sum + x.to_i }) / answers.size.to_f).round(2)
			"Rating for '#{question.text}' is #{rating}"
		end
	end 
end