require_relative 'loader'
require_relative '../model/employee.rb'
require_relative '../model/response.rb'

class ResponsesLoader < Loader

	class << self
    private

		 def generate(csv)
		 	responses = []

      parse(csv) do |parsed_csv|

        parsed_csv.to_a.each do |row|
          (email, id, timestamp) = row[0..2]
          answers = row[3..-1]

          responses << Response.new(
            Employee.create(id, email),
            answers,
            timestamp
          )
        end
      end

      responses
    end
	end
end