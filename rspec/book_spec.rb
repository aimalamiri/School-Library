require_relative '../classes/book'

describe 'Test the Book class' do
  it 'should create a new book' do
    book = Book.new('The Hobbit', 'J.R.R. Tolkien')
    expect(book.title).to eq('The Hobbit')
    expect(book.author).to eq('J.R.R. Tolkien')
  end
end
