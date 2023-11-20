require_relative '../../src/utils/rental'

NO_RENTALS_ERROR_MESSAGE = 'No books were rented so far :('.freeze
INVALID_ID_INPUT_ERROR_MESSAGE = 'Invalid input. Please enter a valid person ID.'.freeze
NO_RENTALS_FOUND_ERROR_MESSAGE = "\nNo rentals found for person with ID %s.".freeze
RENTAL_CREATION_SUCCESS_MESSAGE = 'Rental created successfully'.freeze
RENTAL_CREATION_FAILURE_MESSAGE = 'No books or people available! Cannot create a rental.'.freeze

# Display a list of rentals associated with a specific person based on their ID.
#
# Actions:
# - Checks if there are any rentals available.
# - Prompts the user to enter a person ID.
# - Filters rentals based on the entered person ID.
# - Displays rental details for the selected person, if found.
# - Provides feedback if no rentals or matching person ID is found.
def list_of_rentals_per_person
  return puts NO_RENTALS_ERROR_MESSAGE if @rentals.empty?

  # Get the person ID from user input.
  person_id = program_get_person_id
  return puts INVALID_ID_INPUT_ERROR_MESSAGE if person_id.nil?

  # Filter rentals based on the entered person ID.
  selected_rentals = filter_rentals_by_person_id(person_id)

  if selected_rentals.empty?
    # Display a message if no rentals are found for the specified person ID.
    puts NO_RENTALS_FOUND_ERROR_MESSAGE % person_id
  else
    # Display rentals for the selected person.
    puts "\nRentals:"
    display_rentals(selected_rentals)
  end
end

# Helper method to get user input for person ID.
def program_get_person_id
  print 'Enter the person ID: '
  gets.chomp.strip.tap { |id| return nil if id.empty? }
end

# Helper method to filter rentals based on a given person ID.
def filter_rentals_by_person_id(person_id)
  @rentals.select { |rental| rental.person.id == person_id }
end

# Helper method to display rental details.
def display_rentals(rentals)
  rentals.each do |rental|
    puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
  end
end

# Creates a rental by guiding the user through the selection of a book and a person.
# Displays options for books and people, allowing the user to choose by number.
# If there are no available books or people, outputs a failure message and exits the method.
# After successful selection, prompts the user for a date and creates a rental.
#
# Actions:
# - Checks for the availability of books and people; if empty, outputs a failure message and exits.
# - Invokes the select_book and select_person methods to guide the user in choosing a book and a person.
# - If the user cancels the selection at any point, returns from the method.
# - Prompts the user for a date using the get_user_input method.
  # - Calls the create_and_display_rental method with the chosen date, book, and person.
#
# Parameters: None
# Returns: None
def create_rental
  return puts RENTAL_CREATION_FAILURE_MESSAGE if @books.empty? || @people.empty?

  book_index = select_book
  person_index = select_person

  return unless book_index && person_index

  date = get_user_input('Date: ')
  create_and_display_rental(date, @books[book_index], @people[person_index])
end

# Displays a list of books with their titles and authors, allowing the user to select one by number.
# Returns the index of the selected book or nil if the selection is invalid.
#
# Parameters: None
# Returns: Index of the selected book or nil
def select_book
  display_options('book', @books)
end

# Displays a list of people with their information, allowing the user to select one by number.
# Returns the index of the selected person or nil if the selection is invalid.
#
# Parameters: None
# Returns: Index of the selected person or nil
def select_person
  display_options('person', @people)
end

# Displays a list of options (books or people) with their information, allowing the user to select one by number.
# Returns the index of the selected option or nil if the selection is invalid.
#
# Parameters:
# - type: A string representing the type of options (book or person).
# - options: An array of options to display.
#
# Returns: Index of the selected option or nil
def display_options(type, options)
  puts "Select a #{type} from the following list by number:"
  options.each_with_index do |option, index|
    puts "#{index}) #{display_info(type, option)}"
  end

  index = gets.chomp.to_i

  return index if (0...options.length).cover?(index)

  puts "Invalid #{type} selection. Please choose a valid number.\n"
end

# Returns a formatted string with the information of the given option (book or person).
#
# Parameters:
# - type: A string representing the type of option (book or person).
# - option: The option for which to display information.
#
# Returns: A formatted string with information about the option.
def display_info(type, option)
  case type
  when 'book'
    "Title: \"#{option.title}\", Author: #{option.author}"
  when 'person'
    "[#{option.class}] Name: #{option.name}, ID: #{option.id}, Age: #{option.age}"
  end
end

# Creates and displays a rental using the provided date, book, and person.
#
# Parameters:
# - date: A string representing the date of the rental.
# - book: The Book object for the rental.
# - person: The Person object for the rental.
#
# Returns: None
def create_and_display_rental(date, book, person)
  @rentals << Rental.new(date, book, person)
  puts RENTAL_CREATION_SUCCESS_MESSAGE
end
