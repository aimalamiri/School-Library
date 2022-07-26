require_relative './rental'
require_relative './manage_books'
require_relative './manage_people'

class ManageRentals
  def initialize(persons, books)
    @persons = persons
    @books = books

    @manage_people = ManagePeople.new(@persons)
    @manage_books = ManageBooks.new(@books)
  end

  def list_rentals_by_person_id
    puts 'No person entry found' if @persons.empty?
    print 'Enter person ID: '
    id = gets.chomp.to_i
    @persons.each do |person|
      if person.id == id
        person.rentals.each do |rental|
          puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author} "
        end
      else
        puts "No rentals found for person with id #{id}"
      end
    end
  end

  def add_rental
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

    Rental.new(date, @books[book], @persons[person])

    puts 'Rental created successfully'
  end
end
