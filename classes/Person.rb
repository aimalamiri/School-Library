class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission = true)
    @id = rand(1..10000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    true if self.is_of_age? || @parent_permission
    false
  end

  private

  def is_of_age?
    if @age >= 18
      true
    end
    false
  end
end