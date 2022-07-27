require_relative '../classes/book'
require_relative '../classes/student'
require_relative '../classes/rental'

describe Rental do
  it 'Is an instance of Rental' do
    book = Book.new('Stay with me', 'J-elite')
    student = Student.new(10, 'Stella')
    rental = Rental.new('22-07-2022', book, student)

    expect(rental).to be_instance_of(Rental)
  end
end
