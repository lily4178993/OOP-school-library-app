require_relative '../../src/utils/book'

NO_BOOKS_ERROR_MESSAGE = 'There are no books here! Come later :)'.freeze

# Display a list of books.
#
# Actions:
# - Checks if the list of books is empty and provides a correspondingmessage.
# - If books are present, prints a numbered list of book titles and authors.
def list_of_books
  if @books.empty?
    puts NO_BOOKS_ERROR_MESSAGE
  else
    puts 'List of books:'
    @books.each_with_index do |book, index|
      puts "#{index + 1}. Title: #{book.title}, Author: #{book.author}"
    end
  end
end

# Creates a new book by prompting the user for title and author inputs.
#
# Actions:
# - Utilizes the get_user_input helper method to retrieve title and author from the user.
# - Validates that both title and author are non-empty; otherwise, it outputs an error message.
# - Creates a new Book instance and adds it to the @books array.
# - Outputs a success message if the book is created successfully.
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
