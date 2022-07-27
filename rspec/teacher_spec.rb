require_relative '../classes/teacher'

describe Teacher do
  it 'Is an instance of teacher' do
    teacher = Teacher.new('IT', 45, 'Mary')
    expect(teacher).to be_instance_of(Teacher)
    expect(teacher.can_use_services?).to eq(true)
  end
end
