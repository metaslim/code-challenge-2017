require_relative '../../lib/culture_amp/model/question'

FactoryGirl.define do
  factory :question, class: CultureAmp::Model::Question  do
    transient do
      sequence(:id,0) do |n|
    		n
  		end
			theme "The Work"
			type "ratingquestion"
			text "Rating Question"
    end
    
    initialize_with { CultureAmp::Model::Question.new(id, theme, type, text) }
  end

  factory :single_question, parent: :question do
  	type "singleselect"
  	text "Manager"
	end
end