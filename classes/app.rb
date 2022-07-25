require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './manage_people'
require_relative './manage_books'
require_relative './manage_rentals'

class App
  def initialize
    @persons = []
    @books = []

    @manage_people = ManagePeople.new(@persons)
    @manage_books = ManageBooks.new(@books)
    @manage_rentals = ManageRentals.new(@persons, @books)
  end

  def run
    actions.each { |key, value| puts "#{key}: #{value}" }
    action = gets.chomp.to_i
    action(action)
  end

  private

  def actions
    puts # Add a blank line before the actions list
    {
      1 => 'List all books',
      2 => 'List all people',
      3 => 'Create a person',
      4 => 'Create a book',
      5 => 'Create a rental',
      6 => 'List all rentals for a given person id',
      7 => 'Exit'
    }
  end

  def action(action)
    action_list = { 1 => [@manage_books, 'list_books'], 2 => [@manage_people, 'list_people'],
                    3 => [@manage_people, 'add_person'], 4 => [@manage_books, 'add_book'],
                    5 => [@manage_rentals, 'add_rental'], 6 => [@manage_rentals, 'list_rentals_by_person_id'],
                    7 => 'exit' }

    if action_list.key?(action)
      exit if action_list[action] == 'exit'
      action_list[action][0].send(action_list[action][1])
    else
      puts 'Invalid input!'
    end

    run # List actions once the user is done with the current action
  end
end
