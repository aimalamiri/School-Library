require_relative '../classes/classroom'

describe Classroom do
  it 'should have a label' do
    classroom = Classroom.new('Physics')
    expect(classroom.label).to eq('Physics')
    expect(classroom.students.length).to eq(0)
  end

  it 'should have a student' do
    classroom = Classroom.new('Physics')
    expect(classroom.students).to eq([])
  end
end
