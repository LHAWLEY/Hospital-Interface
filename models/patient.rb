class Patient
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "Patient #{@name}"
  end
end
