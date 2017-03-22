require_relative 'presenter'

class RatingAverage < Presenter
	def style
		questions_for('ratingquestion').map do |question|
			answers = answers_for(question)
			rating = rating_for(answers)
			"Rating for '#{question.text}' is #{rating}"
		end
	end

	private

	def rating_for(answers)
		((answers.inject(0){|sum,x| sum + x.to_i }) / answers.size.to_f).round(2)
	end
end