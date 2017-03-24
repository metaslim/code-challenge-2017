require_relative '../../lib/model/response'

FactoryGirl.define do
  factory :response  do
    transient do
      association :employee, factory: :employee, strategy: :build
      answers [5,5,5,5,5]
      timestamp "2014-07-31T11:35:41+00:00"
    end
    
    initialize_with { Response.new(employee, answers, timestamp) }
  end

  factory :single_question_response, parent: :response do
    answers ['Mary']
  end

  factory :unsubmitted_response, parent: :response do
    timestamp nil
  end
end