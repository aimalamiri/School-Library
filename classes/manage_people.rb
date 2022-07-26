class ManagePeople
  def initialize(persons = [])
    @persons = persons
  end

  def add_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type = gets.chomp.to_i

    puts 'Invalide input' if type != 1 && type != 2
    add_student if type == 1 # Create a student if the user entered 1
    add_teacher if type == 2 # Create a teacher if the user entered 2
  end

  def list_people(show_index: false)
    @persons.each_with_index do |person, index|
      result = "[#{person.class.name}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      result = "#{index}) " + result if show_index
      puts result
    end
  end

  def add_student
    print 'Enter the name of the student: '
    name = gets.chomp.to_s
    print 'Enter the age of the student: '
    age = gets.chomp.to_i
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.to_s.downcase == 'y'
    student = Student.new(age, name, parent_permission: parent_permission)
    @persons << student

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
    @persons << teacher

    puts "Student with id #{teacher.id} created"
  end
end
