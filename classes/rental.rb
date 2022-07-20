class Rental
  attr_accessor :date

  def initialize(date)
    @date = date
    @book = nil
  end

  def add_book(book)
    @book = book
    book.rentals << self
  end
end
