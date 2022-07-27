require_relative './file_writer'
require_relative './file_reader'

class ManageBooks
  def initialize(books)
    @books = books
    @writer = FileWriter.new('books.json')
    @reader = FileReader.new('books.json')
    load_books
  end

  def list_books(show_index: false)
    @books.each_with_index do |book, index|
      result = "Title: \"#{book.title}\", Author: #{book.author}"
      result = " #{index}) " + result if show_index
      puts result
    end
  end

  def add_book
    print 'Enter the name of the book: '
    name = gets.chomp.to_s
    print 'Enter the author of the book: '
    author = gets.chomp.to_s
    book = Book.new(name, author)
    @books << book
    @writer.write_data(book)
    puts 'Book created successfully'
  end

  def load_books
    @books = @reader.read_data('Book')
    @books
  end
end
