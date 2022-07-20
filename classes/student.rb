require_relative './person'

class Student < Person
  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, parent_permission: parent_permission)
    @classroom = classroom
    @name = name
    @classroom = nil
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def add_classroom(classroom)
    @classroom = classroom
    @classroom.students << self
  end
end
