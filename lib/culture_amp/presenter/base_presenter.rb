require_relative '../helper/response_helper'

module CultureAmp
	module Presenter
		class BasePresenter
			include CultureAmp::ResponseHelper
			attr_reader :decoratee

			def decorate(decoratee)
				@decoratee = decoratee
				decoratee.append(style)
			end

			def style
				 raise NotImplementedError
			end
		end
	end
end