require_relative '../../src/utils/book'

NO_BOOKS_ERROR_MESSAGE = 'There are no books here! Come later :)'.freeze

def list_of_books
  if @books.empty?
    puts NO_BOOKS_ERROR_MESSAGE
  else
    puts 'List of books:'
    display_books
  end
end

def display_books
  @books.each_with_index do |book, index|
    display_book(index + 1, book)
  end
end

def display_book(index, book)
  if book.is_a?(Book) || (book.is_a?(Hash) && book[:title] && book[:author])
    puts "#{index}. #{book_info(book)}"
  else
    puts "#{index}. Invalid book entry"
  end
end

def book_info(book)
  if book.is_a?(Book)
    "Title: #{book.title}, Author: #{book.author}"
  elsif book.is_a?(Hash) && book[:title] && book[:author]
    "Title: #{book[:title]}, Author: #{book[:author]}"
  else
    'Invalid book entry'
  end
end

def create_book
  title = get_user_input('Title')
  author = get_user_input('Author')

  if title.empty? || author.empty?
    puts 'Invalid input. Title and author cannot be empty.'
    return
  end

  @books << Book.new(title, author)
  puts 'Book created successfully'
end
