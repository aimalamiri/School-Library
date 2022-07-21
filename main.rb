require_relative './classes/person'
require_relative './classes/student'
require_relative './classes/'
require_relative './classes/book'
require_relative './classes/rental'
require_relative './classes/capitalize_decorator'
require_relative './classes/trimmer_decorator'

class App
  def run
    actions.each { |key, value| puts "#{key}: #{value}" }
    action = gets.chomp.to_i
    action(action)
  end

  def actions
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
    case action
    when 1
      puts 'list all books'
    when 2
      puts 'list all people'
    when 3
      puts 'create a person'
    when 4
      puts 'create a book'
    when 5
      puts 'create a rental'
    when 6
      puts 'list all rentals for a given person id'
    else
      puts 'Invalid action'
    end
  end
end

def main
  app = App.new
  app.run
end

main
