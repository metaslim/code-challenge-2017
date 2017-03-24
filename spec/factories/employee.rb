require_relative '../../lib/model/employee'

FactoryGirl.define do
  factory :employee  do
    transient do
      id 1
      email  'employee1@abc.xyz'
    end
    
    initialize_with { Employee.new(id, email) }
  end
end