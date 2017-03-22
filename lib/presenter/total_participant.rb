require_relative 'presenter'

class TotalParticipant < Presenter
	def style
		"The total participant(s) is #{total_responses}"
	end 
end