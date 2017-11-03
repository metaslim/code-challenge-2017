require_relative '../spec_helper'
require_relative '../../lib/culture_amp/model/response'

describe "response model" do
  let(:employee) { build(:employee) }
  let(:answers) { [5,5,5,5,5] }
  let(:timestamp) { '2014-07-31T11:35:41+00:00' }

  let(:response) { CultureAmp::Model::Response.new(employee, answers, timestamp) }

  it "has correct employee, answers, timestamp" do
    expect(response.employee).to eq employee
    expect(response.answers).to eq answers
    expect(response.timestamp).to eq timestamp
    expect(response.is_valid?).to eq true
  end

  it "tag response as invalid" do
    expect(CultureAmp::Model::Response.new(employee, answers, nil).is_submitted?).to eq false
  end

  it "tag response as invalid due to missing email and id" do
    employee.id = nil
    employee.email = nil
    expect(CultureAmp::Model::Response.new(employee, answers, nil).is_valid?).to eq false
  end
end
