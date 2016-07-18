require_relative '../models/employee.rb'

describe Admin do
  let(:admin) { Admin.new(username: "LHAWLEY", password: "IluvSophia") }

  it 'can be created' do
    expect(admin).to be
  end

  it 'inherits from Employee' do
    expect(admin).to be_a Employee
  end
end