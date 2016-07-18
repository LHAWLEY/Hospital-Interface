require_relative '../models/employee.rb'

describe Employee do
  let(:employee) { Employee.new(username: "LHAWLEY", password: "IluvSophia") }

  it 'can be created' do
    expect(employee).to be
  end

  describe '#username' do
    it 'can have a username' do
      expect(employee.username).to eq "LHAWLEY"
    end
  end

  describe '#password' do
    it 'can have a password' do
      expect(employee.password).to eq "IluvSophia"
    end
  end

  describe '#can?' do
    context 'when the user has a given permission' do
      it 'returns true' do
        expect(employee.can?('exit')).to eq true
      end
    end

    context 'when the user does not have a given permission' do
      it 'returns false' do
        expect(employee.can?('view_patient_record')).to eq false
      end
    end
  end

  describe '#to_s' do
    it 'returns the username' do
      expect(employee.to_s).to eq 'LHAWLEY'
    end
  end

  describe '.create' do
    let(:employee) { Employee.create(username: 'bob', password: 'pass', job: job) }

    context 'when job is "doctor"' do
      let(:job) { 'Doctor' }

      it 'creates a doctor' do
        expect(employee).to be_a Doctor
      end
    end

    context 'when job is "janitor"' do
      let(:job) { 'Janitor' }

      it 'creates a janitor' do
        expect(employee).to be_a Janitor
      end
    end

    context 'when job is "receptionist"' do
      let(:job) { 'Receptionist' }

      it 'creates a receptionist' do
        expect(employee).to be_a Receptionist
      end
    end

    context 'when job is "admin"' do
      let(:job) { 'Admin' }

      it 'creates an admin' do
        expect(employee).to be_a Admin
      end
    end
  end
end