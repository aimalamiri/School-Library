require_relative './rental'
require_relative './manage_books'
require_relative './manage_people'
require_relative './file_writer'
require_relative './file_reader'

class ManageRentals
  def initialize(persons, books)
    @persons = persons
    @books = books

    @manage_people = ManagePeople.new(@persons)
    @manage_books = ManageBooks.new(@books)
    @writer = FileWriter.new('rentals.json')
    @reader = FileReader.new('rentals.json')
    @reader.read_relations(@persons, @books)
  end

  def list_rentals_by_person_id
    puts 'No person entry found' if @persons.empty?
    print 'Enter person ID: '
    id = gets.chomp.to_i
    @persons.each do |person|
      puts "No rentals found for person with id #{id}" if person.id == id && person.rentals.empty?
      next unless person.id == id

      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author} "
      end
      return true
    end
    puts "Person with id #{id} does not exist"
  end

  def add_rental
    load_data

    puts 'Select a book from the following list by number'
    @manage_books.list_books(show_index: true)
    book = gets.chomp.to_i
    puts 'Invalid input!' if !(book.is_a? Integer) && book >= @books.length

    puts 'Select a person from the following list by number (not id)'
    @manage_people.list_people(show_index: true)
    person = gets.chomp.to_i
    puts 'Invalide input!' if !(person.is_a? Integer) && person >= @people.length

    print 'Please enter the date: '
    date = gets.chomp.to_s

    rental = Rental.new(date, @books[book], @persons[person])
    @writer.write_data(rental)
    puts 'Rental created successfully'
  end

  def load_data
    @manage_people.load_people
    @persons = @manage_people.persons
    @manage_books.load_books
    @books = @manage_books.books
  end
end
