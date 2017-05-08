require_relative 'base_presenter'

module CultureAmp
	module Presenter
		class ParticipationPercentage < CultureAmp::Presenter::BasePresenter
			def style
				percentage = (
					number_of_valid_reponses / total_responses.to_f
				)
				.round(2) * 100

				"The participation percentage is #{percentage.to_i}%"
			end
		end
	end
end