class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    add_book(book) unless book.nil?
    add_person(person) unless person.nil?
  end

  def add_book(book)
    @book = book
    book.rentals << self
  end

  def add_person(person)
    @person = person
    person.rentals << self
  end

  def to_json(*_args)
    { class: self.class.name, person: @person.id, book: @book.title, date: @date }.to_json
  end

  def from_json!(json, persons, books)
    JSON.load(json).each do |var, val|
      @date = val if var == 'date'
      if var == 'person'
        persons.each do |person|
          add_person(person) if person.id == val
        end
      end
      next unless var == 'book'

      books.each do |book|
        add_book(book) if book.title == val
      end
    end
  end
end
