require_relative './jsonable'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  include JSONable

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
    rental.book = self
  end
end
