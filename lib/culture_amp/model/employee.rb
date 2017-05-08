require_relative 'registry'

module CultureAmp
  module Model
    class Employee < CultureAmp::Model::Registry
    	attr_accessor :email, :id

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

      def is_valid?
        id != nil && email != nil
      end
    end
  end
end