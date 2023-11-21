require_relative '../../src/utils/book'

NO_BOOKS_ERROR_MESSAGE = 'There are no books here! Come later :)'.freeze

def list_of_books
    return puts NO_BOOKS_ERROR_MESSAGE if @books.empty?
  
    puts 'List of books:'
    @books.each_with_index do |book, index|
      if book.is_a?(Book)
        puts "#{index + 1}. Title: #{book.title}, Author: #{book.author}"
      else
        puts "#{index + 1}. #{book}"
      end
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
