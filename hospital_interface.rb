require_relative './models/hospital.rb'
require_relative './models/patient.rb'
require_relative './models/employee.rb'

# Fat Models, Thin controllers
  # Models have all application logic
  # Controller simply coordinates between user input
  # and all necessary models

class HospitalInterface
  COMMANDS = {
    '1' => 'exit',
    '2' => 'view_patient_record',
    '3' => 'list_patients',
    '4' => 'add_patient',
    '5' => 'release_patient',
    '6' => 'add_employee',
    '7' => 'remove_employee',
    '8' => 'list_employees'
  }.freeze

  def initialize
    @hospital = Hospital.new({name: 'LeeAnne', location: 'Memorial'})
    @hospital.load_employees
    login
    loop do
      list_commands
      handle_input
    end
  end

  def login
    @current_user = @hospital.find_employee(get_employee_name)
  end

  def list_commands
    puts ''
    COMMANDS.each do |number, command|
      puts "#{number}.  #{command.gsub('_', ' ')}" if @current_user.can?(command)
    end
    puts "\n\nPlease select a command number."
  end

  def handle_input
    command = COMMANDS[user_input]
    send(command) if @current_user.can?(command)
  end

  def user_input
    gets.chomp
  end

  def exit
    abort
  end

  def list_patients
    @hospital.list_patients
  end

  def get_patient_name
    p 'Enter Patient Name:'
    user_input
  end

  def add_patient
    patient = Patient.new(get_patient_name)
    @hospital.admit_patient(patient)
  end

  def release_patient
    @hospital.release_patient(get_patient_name)
  end

  def view_patient_record
    puts @hospital.view_patient_record(get_patient_name)
  end

  def get_employee_name
    p 'Enter Employee Username:'
    username = user_input
    p 'Enter Employee Password:'
    password = user_input

    {username: username, password: password}
  end

  def add_employee
    employee = Employee.new(get_employee_name)
    @hospital.hire_employee(employee)
  end

  def list_employees
    @hospital.list_employees
  end

  def remove_employee
    @hospital.remove_employee(get_employee_name)
  end
end

HospitalInterface.new