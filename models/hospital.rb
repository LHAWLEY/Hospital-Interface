require 'csv'
require_relative './employee.rb'

class Hospital
  attr_reader :name, :location, :patients, :employees

  def initialize(args={})
    @name = args[:name]
    @location =  args[:location]
    @employees = []
    @patients = []
  end

  def load_employees
    CSV.foreach('./datasets/employees.csv', headers: true, header_converters: :symbol) do |row|
      @employees << Employee.create(row.to_hash)
    end
  end

  def number_of_patients
    @patients.length
  end

  def number_of_employees
    @employees.length
  end

  def admit_patient(patient)
    @patients << patient
  end

  def hire_employee(employee)
    @employees << employee
  end

  def list_patients
    patients.each do |patient|
      puts patient
    end
  end

  def list_employees
    @employees.each do |employee|
      puts employee
    end
  end

  def release_patient(patient_name)
    patients.reject! do |patient|
      patient_name == patient.name
    end
  end


  def view_patient_record(patient_name)
    patients.find do |patient|
      patient_name == patient.name
    end
  end

  def remove_employee(username_and_password)
    @employees.reject! do |employee|
      username_and_password[:username] == employee.username
    end
  end

  def find_employee(credentials) # credentials is {username: '', password: ''}
    @employees.find do |employee|
      employee.username == credentials[:username] &&
        employee.password == credentials[:password]
    end
  end
end
