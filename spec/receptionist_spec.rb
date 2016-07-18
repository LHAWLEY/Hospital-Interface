require_relative '../models/employee.rb'

describe Receptionist do
  let(:receptionist) { Receptionist.new(username: "LHAWLEY", password: "IluvSophia") }

  it 'can be created' do
    expect(receptionist).to be
  end

  it 'inherits from Employee' do
    expect(receptionist).to be_a Employee
  end
end