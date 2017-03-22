require_relative 'registry'

class Employee < Registry
	attr_reader :email, :id

	@registry = {}

  class << self
    def create(id, email)
      @registry[id] || new(id, email).register
    end
  end

  def initialize(id, email)
		@id = id
		@email = email
	end
end