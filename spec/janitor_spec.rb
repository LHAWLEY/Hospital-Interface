require_relative '../models/employee.rb'

describe Janitor do
  let(:janitor) { Janitor.new(username: "LHAWLEY", password: "IluvSophia") }

  it 'can be created' do
    expect(janitor).to be
  end

  it 'inherits from Employee' do
    expect(janitor).to be_a Employee
  end
end