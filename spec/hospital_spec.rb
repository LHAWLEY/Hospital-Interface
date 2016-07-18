require_relative '../models/hospital.rb'
require_relative '../models/patient.rb'
require_relative '../models/employee.rb'


describe Hospital do
  let(:hospital) { Hospital.new(name: "Rush Memorial", location: "Chicago, IL") }

  describe '#name' do
    it 'returns the name of the hospital' do
      expect(hospital.name).to eq "Rush Memorial"
    end
  end

  describe '#location' do
    it 'returns the location of the hospital' do
      expect(hospital.location).to eq "Chicago, IL"
    end
  end

  describe '#number_of_patients' do
    it 'returns the number of patients at the hospital' do
      expect(hospital.number_of_patients).to eq 0
    end
  end

  describe '#number_of_employees' do
    it 'returns the number of employees at the hospital' do
      expect(hospital.number_of_employees).to eq 0
    end
  end

  describe '#admit_patient' do
    it 'adds a patient to the hospital' do
      nate = Patient.new('Nate')

      hospital.admit_patient(nate)

      expect(hospital.patients).to include(nate)
    end
  end

  describe '#hire_employee' do
    it 'adds an employee to the hospital' do
      nate = Employee.new

      hospital.hire_employee(nate)

      expect(hospital.employees).to include(nate)
    end
  end

  # describe '#load_employees' do
  #   it 'adds leeanne to the hospital employees' do
  #     hospital.load_employees

  #     leeanne = hospital.find_employee(username: 'leeanne', password: 'password')

  #     expect(leeanne).to be
  #   end
  # end

  describe '#release_patient' do
    it 'removes a patient from the hospital' do
      nate = Employee.new

      hospital.release_patient(nate)

      expect(hospital.employees).not_to include(nate)
    end
  end

  describe '#view_patient_record' do
    it 'finds a given patient' do
      sarah = Patient.new('Sarah')

      hospital.admit_patient(sarah)

      record = hospital.view_patient_record(sarah.name)

      expect(record.name).to eq("Sarah")
    end
  end

  describe '#remove_employee' do
    it 'removes a given employee from the hospital' do

    end
  end

  describe '#find_employee' do
    it 'finds an employee by their username and password' do
      employee = Employee.new(username: 'leeanne', password: 'password')
      hospital.hire_employee(employee)

      employee_hired = hospital.find_employee(username: 'leeanne', password: 'password')

      expect(employee_hired).to be
    end
  end
end

# preparation - anything to you require to be able to call the method
# execution - calling the method
# expectation - what you expect