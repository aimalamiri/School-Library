require_relative '../classes/capitalize_decorator'
require_relative '../classes/person'

describe 'Test the CapitalizeDecorator class' do
  it 'should capitalize the letters of the string' do
    person = Person.new(20, 'Ahmad')
    capitlize = CapitalizeDecorator.new(person)
    expect(capitlize.correct_name).to eq('AHMAD')
  end
end
