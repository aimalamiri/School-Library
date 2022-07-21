require_relative './classes/person'
require_relative './classes/student'
require_relative './classes/teacher'
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

  private

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
      add_person
    when 4
      add_book
    when 5
      puts 'create a rental'
    when 6
      puts 'list all rentals for a given person id'
    else
      puts 'Invalid action'
    end
  end

  def add_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type = gets.chomp.to_i

    puts 'Invalide input' if type != 1 && type != 2
    add_student if type == 1 # Create a student if the user entered 1
    add_teacher if type == 2 # Create a teacher if the user entered 2

    run
  end

  def add_student
    print 'Enter the name of the student: '
    name = gets.chomp.to_s
    print 'Enter the age of the student: '
    age = gets.chomp.to_i
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.to_s.downcase == 'y'
    student = Student.new(age, name, parent_permission: parent_permission)
    puts "Student with id #{student.id} created"
  end

  def add_teacher
    print 'Enter the name of the teacher: '
    name = gets.chomp.to_s
    print 'Enter the age of the teacher: '
    age = gets.chomp.to_i
    print "And teacher's specialization: "
    specilization = gets.chomp.to_s
    teacher = Teacher.new(specilization, age, name)
    puts "Student with id #{teacher.id} created"
  end

  def add_book
    print 'Enter the name of the book: '
    name = gets.chomp.to_s
    print 'Enter the author of the book: '
    author = gets.chomp.to_s
    Book.new(name, author)
    puts 'Book created successfully'

    run
  end
end

def main
  app = App.new
  app.run
end

main
