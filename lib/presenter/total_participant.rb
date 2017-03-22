require_relative 'presenter'
require_relative 'response_helper'

class TotalParticipant < Presenter
	include ResponseHelper
	
	def style
		"The total participant is #{total_responses}"
	end 
end