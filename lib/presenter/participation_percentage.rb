require_relative 'presenter'

class ParticipationPercentage < Presenter
	def style
		percentage = (
			number_of_submitted_reponses / total_responses.to_f
		)
		.round(2) * 100

		"The participation percentage is #{percentage.to_i}%"
	end
end