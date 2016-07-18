require_relative '../models/employee.rb'

describe Doctor do
  let(:doctor) { Doctor.new(username: "LHAWLEY", password: "IluvSophia") }

  it 'can be created' do
    expect(doctor).to be
  end

  it 'inherits from Employee' do
    expect(doctor).to be_a Employee
  end
end