require_relative '../../lib/culture_amp/model/employee'

FactoryGirl.define do
  factory :employee, class: CultureAmp::Model::Employee do
    #transient do
      sequence :id do |n|
        n
      end

      sequence :email do |n|
        "employee#{n}@abc.xyz"
      end
    #end

    initialize_with { CultureAmp::Model::Employee.new(id, email) }
  end
end
