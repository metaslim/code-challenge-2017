require_relative 'loader'
require_relative '../model/question.rb'

class QuestionsLoader < Loader

	class << self

		private

		 def generate(csv)
		 	questions = []

		 	parse(csv) do |parsed_csv|

		 		parsed_csv.to_a[1..-1].each do |row|
					(theme, type, text) = row

      		questions << Question.new(
      			theme,
      			type,
      			text
      		)
      	end
      	
      	questions
      end

    end
	end
end