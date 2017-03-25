require_relative '../../lib/culture_amp/model/employee'

describe "employee model" do
	def employee
		@employee
	end

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
end