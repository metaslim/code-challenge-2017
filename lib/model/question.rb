class Question
	attr_reader :theme, :type, :text

	def initialize(theme, type, text)
		@theme = theme
		@type = type
		@text = text
	end
end