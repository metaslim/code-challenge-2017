require_relative '../spec_helper'
require_relative '../../lib/model/response'

describe "response model" do
	def response
		@response
	end

	let(:employee) { build(:employee) }
	let(:answers) { [5,5,5,5,5] }
	let(:timestamp) { '2014-07-31T11:35:41+00:00' }

	let(:response) { Response.new(employee, answers, timestamp) }

	it "has correct employee, answers, timestamp" do
  	expect(response.employee).to eq employee
  	expect(response.answers).to eq answers
  	expect(response.timestamp).to eq timestamp
  end

  it "tag response as invalid" do
  	expect(Response.new(employee, answers, nil).is_submitted?).to eq false
  end
end