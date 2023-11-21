# rentals.rb

require_relative '../../src/utils/person'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    @book.rentals << self unless @book.rentals.include?(self)
    @person.rentals << self unless @person.rentals.include?(self)
  end
end

NO_RENTALS_ERROR_MESSAGE = 'No books were rented so far :('.freeze
INVALID_ID_INPUT_ERROR_MESSAGE = 'Invalid input. Please enter a valid person ID.'.freeze
NO_RENTALS_FOUND_ERROR_MESSAGE = "\nNo rentals found for person with ID %s.".freeze
RENTAL_CREATION_SUCCESS_MESSAGE = 'Rental created successfully'.freeze
RENTAL_CREATION_FAILURE_MESSAGE = 'No books or people available! Cannot create a rental.'.freeze

def list_of_rentals_per_person
  return puts NO_RENTALS_ERROR_MESSAGE if @rentals.empty?

  person_id = program_get_person_id
  return puts INVALID_ID_INPUT_ERROR_MESSAGE if person_id.nil?

  # Ensure each rental in selected_rentals is a Rental instance
  selected_rentals = filter_rentals_by_person_id(person_id)

  if selected_rentals.empty?
    puts NO_RENTALS_FOUND_ERROR_MESSAGE % person_id
  else
    puts "\nRentals:"
    display_rentals(selected_rentals)
  end
end

def program_get_person_id
  print 'Enter the person ID: '
  gets.chomp.strip.tap { |id| return nil if id.empty? }
end

def filter_rentals_by_person_id(person_id)
  @rentals.select do |rental|
    rental.is_a?(Rental) && rental.person.is_a?(Person) && rental.person.id.to_s.downcase.start_with?(person_id.downcase)
  end
end



def display_rentals(rentals)
  rentals.each do |rental|
    puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
  end
end

def select_book
  book_index = display_options('book', @books)
  return @books[book_index] if (0...@books.length).cover?(book_index)

  puts "Invalid book selection. Please choose a valid number.\n"
  nil  # Return nil in case of an invalid selection
end

def select_person
  person_index = display_options('person', @people)
  return @people[person_index] if (0...@people.length).cover?(person_index)

  puts "Invalid person selection. Please choose a valid number.\n"
  nil  # Return nil in case of an invalid selection
end


def display_options(type, options)
  puts "Select a #{type} from the following list by number:"
  options.each_with_index do |option, index|
    puts "#{index}) #{display_info(type, option)}"
  end

  index = gets.chomp.to_i

  return index if (0...options.length).cover?(index)

  puts "Invalid #{type} selection. Please choose a valid number.\n"
end

def display_info(type, option)
  case type
  when 'book'
    if option.respond_to?(:title) && option.respond_to?(:author)
      "Title: \"#{option.title}\", Author: #{option.author}"
    else
      "Invalid book option"
    end
  when 'person'
    if option.respond_to?(:name) && option.respond_to?(:id) && option.respond_to?(:age)
      "[#{option.class}] Name: #{option.name}, ID: #{option.id}, Age: #{option.age}"
    else
      "Invalid person option"
    end
  when 'rental'
    if option.respond_to?(:date) && option.respond_to?(:book) && option.book.respond_to?(:title) && option.book.respond_to?(:author)
      "Date: #{option.date}, Book: \"#{option.book.title}\" by #{option.book.author}"
    else
      "Invalid rental option"
    end
  else
    "Invalid option type"
  end
end


def create_and_display_rental(date, book, person)
  if book.nil? || person.nil? || !book.is_a?(Book) || !person.is_a?(Person)
    puts RENTAL_CREATION_FAILURE_MESSAGE
    return
  end

  # Ensure that book and person are instances of the Book and Person classes
  book = @books.find { |b| b == book && b.is_a?(Book) }
  person = @people.find { |p| p == person && p.is_a?(Person) }

  # puts "DEBUG: book class: #{book.class}, book.inspect: #{book.inspect}"
  # puts "DEBUG: person class: #{person.class}, person.inspect: #{person.inspect}"

  @rentals << Rental.new(date, book, person)
  puts RENTAL_CREATION_SUCCESS_MESSAGE
end
