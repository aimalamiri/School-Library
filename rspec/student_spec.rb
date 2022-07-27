require_relative '../classes/student'

describe 'Test the Student class' do
  it 'creates a new student' do
    student = Student.new(20, 'John')
    expect(student.id).instance_of?(Integer)
    expect(student.age).to eq(20)
    expect(student.name).to eq('John')
    expect(student.can_use_services?).to eq(true)
  end
end
