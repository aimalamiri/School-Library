require_relative './person'

class Teacher < Person
  def initialize(specialization, age, name = 'Unknown')
    super(age)
    @specialization = specialization
    @name = name
  end

  def can_use_services?
    true
  end
end
