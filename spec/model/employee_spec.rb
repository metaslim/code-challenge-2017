require_relative '../../lib/culture_amp/model/employee'

describe "employee model" do
	let(:id) { 1 }
	let(:email) { 'employee1@abc.xyz' }

	let(:employee) { CultureAmp::Model::Employee.create(id, email) }

	it "has correct email and id" do
  	expect(employee.id).to eq id
  	expect(employee.email).to eq email
  end

  it "does not create duplicate employee" do
  	new_employee = CultureAmp::Model::Employee.create(id, email)
  	expect(employee).to eq new_employee
  end

  it "has no email and id" do
    employee.id = nil
    employee.email = nil
    expect(employee.is_valid?).to eq false
  end
end