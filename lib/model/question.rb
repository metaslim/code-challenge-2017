require_relative 'registry'

class Question < Registry
	attr_reader :id, :theme, :type, :text

	@registry = {}

  class << self
    def create(id, theme, type, text)
      @registry[id] || new(id, theme, type, text).register
    end
  end

	def initialize(id, theme, type, text)
		@id = id
		@theme = theme
		@type = type
		@text = text
	end
end