require_relative '../../lib/model/question'

FactoryGirl.define do
  factory :question  do
    transient do
      sequence :id do |n|
    		n
  		end
			theme "The Work"
			type "ratingquestion"
			text "Question"
    end
    
    initialize_with { Question.new(id, theme, type, text) }
  end
end