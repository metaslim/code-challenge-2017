require_relative '../../lib/model/employee'

FactoryGirl.define do
  factory :employee  do
    transient do
      sequence :id do |n|
    		n
  		end
  		
  		sequence :email do |n|
    		"employee#{n}@abc.xyz"
  		end  
    end
    
    initialize_with { Employee.new(id, email) }
  end
end