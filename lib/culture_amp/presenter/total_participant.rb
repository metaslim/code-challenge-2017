require_relative 'base_presenter'

module CultureAmp
	module Presenter
		class TotalParticipant < CultureAmp::Presenter::BasePresenter
			def style
				"The total participant(s) is #{total_responses}"
			end 
		end
	end
end