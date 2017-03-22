require_relative 'presenter'

class ParticipationPercentage < Presenter
	def style
		percentage = (
			decoratee.responses.select {|response| response.is_submitted?}.size / total_responses.to_f
		)
		.round(2) * 100

		"The participation percentage is #{percentage.to_i}%"
	end 
end