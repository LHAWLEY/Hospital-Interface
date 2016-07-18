class Employee
  attr_reader :username, :password

  def initialize(args={})
    @username = args[:username]
    @password = args[:password]
    @permissions = %w{exit}.freeze
  end

  def to_s
    "#{@username}"
  end

  def can?(privilege)
    @permissions.include?(privilege)
  end

  def self.create(attributes={})
    case attributes[:job]
    when 'Doctor'
      Doctor.new(attributes)
    when 'Janitor'
      Janitor.new(attributes)
    when 'Receptionist'
      Receptionist.new(attributes)
    when 'Admin'
      Admin.new(attributes)
    else
      Employee.new(attributes)
    end
  end
end

class Doctor < Employee
  def initialize(args={})
    super(args)
    @permissions = %w{exit view_patient_record list_patients}.freeze
  end
end

class Admin < Employee
  def initialize(args={})
    super(args)
    @permissions = %w{
      exit
      view_patient_record
      list_patients
      add_patient
      release_patient
      add_employee
      remove_employee
      list_employees
    }.freeze
  end
end

class Janitor < Employee

end

class Receptionist < Employee

end