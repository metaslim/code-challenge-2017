require_relative '../helper/response_helper'

class Presenter
	include ResponseHelper
	attr_reader :decoratee

	def decorate(decoratee)
		@decoratee = decoratee
		decoratee.append(style)
	end

	def style
		 raise NotImplementedError
	end
end