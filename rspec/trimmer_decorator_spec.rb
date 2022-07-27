require_relative '../classes/person'
require_relative '../classes/trimmer_decorator'

describe 'Test the TrimmerDecorator class' do
  it 'should trim the string' do
    person = Person.new(20, 'ahmad shah abdali baba')
    trimmer = TrimmerDecorator.new(person)
    expect(trimmer.correct_name).to eq('ahmad shah')
  end
end
