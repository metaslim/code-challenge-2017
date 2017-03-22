class Presenter
	attr_reader :decoratee

	def decorate(decoratee)
		@decoratee = decoratee
		decoratee.append(style)
	end

	def style
		 raise NotImplementedError
	end 
end