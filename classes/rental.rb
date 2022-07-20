class Rental
  attr_accessor :date

  def initialize(date, book, rental)
    @date = date
    @book = book
    @person = rental
  end

  def add_book(book)
    @book = book
    book.rentals << self
  end

  def add_person(person)
    @person = person
    person.rentals << self
  end
end
