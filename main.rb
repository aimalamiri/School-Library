require_relative './classes/person'
require_relative './classes/book'
require_relative './classes/rental'
require_relative './classes/capitalize_decorator'
require_relative './classes/trimmer_decorator'

person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name

book = Book.new('The Hobbit', 'J.R.R. Tolkien')
rental = Rental.new('2018-01-01', book, person)

puts book.rentals.first.person.age
puts rental.book.author
