require_relative '../classes/person'

describe 'Test the Person class' do
  it 'creates a new person' do
    person = Person.new(20, 'John')
    expect(person.id).instance_of?(Integer)
    expect(person.age).to eq(20)
    expect(person.name).to eq('John')
  end
end
