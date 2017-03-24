require_relative '../../lib/model/question'

FactoryGirl.define do
  factory :question  do
    transient do
      sequence(:id,0) do |n|
    		n
  		end
			theme "The Work"
			type "ratingquestion"
			text "Rating Question"
    end
    
    initialize_with { Question.new(id, theme, type, text) }
  end

  factory :single_question, parent: :question do
  	type "singleselect"
  	text "Manager"
	end
end