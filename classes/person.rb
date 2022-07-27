require_relative './jsonable'
require_relative './nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  include JSONable

  def initialize(age, name = 'Unknown')
    @id = rand(1..10_000)
    @name = name
    @age = age
    @rentals = []
    super()
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals << rental
    rental.person = self
  end
end
