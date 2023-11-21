require_relative '../src/modules/people'
require_relative '../src/modules/books'
require_relative '../src/modules/rentals'
require_relative '../src/utils/get_user_input'
require_relative '../src/utils/validate_user_input'
require_relative '../src/utils/parent_permission'
require 'json'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []

    # Load data on startup
    load_data
  end

  def create_a_person
    loop do
      print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
      user_choice = STDIN.gets.chomp.to_i

      if user_choice == 1
        create_student
        save_data
        break
      elsif user_choice == 2
        create_teacher
        save_data
        break
      else
        puts 'Invalid input. Please enter either 1 for student or 2 for teacher.'
      end
    end
  end

  def create_a_rental
    loop do
      return if user_does_not_want_to_create_rental?
      create_and_display_rental(get_user_input('Date'), select_book, select_person)
      save_data
    end
  end

  def create_a_book
    create_book
    save_data
  end

  def user_does_not_want_to_create_rental?
    print 'Do you want to create a rental? (yes/no): '
    answer = gets.chomp.downcase
    answer != 'yes'
  end

  def create_a_book
    create_book
  end

  def list_all_books
    list_of_books
  end

  def list_all_people
    list_of_people
  end

  def list_all_rentals_per_person
    list_of_rentals_per_person
  end
  
  def save_data
    save_to_json('books.json', @books)
    save_to_json('people.json', @people)
    save_to_json('rentals.json', @rentals)
  end

  private

  def save_to_json(file_name, data)
    File.open(file_name, 'w') do |file|
      file.puts JSON.dump(data)
    end
  end

  def load_from_json(file_name)
    JSON.parse(File.read(file_name)) if File.exist?(file_name)
  end

  def load_data
    @books = load_from_json('books.json') || []
    @people = load_from_json('people.json') || []
    @rentals = load_from_json('rentals.json') || []
  end

  def list_of_books
    return puts NO_BOOKS_ERROR_MESSAGE if @books.empty?

    puts 'List of books:'
    @books.each_with_index do |book, index|
      puts "#{index + 1}. #{book}"
    end
  end

  def list_of_people
    if @people.empty?
      puts NO_PEOPLE_ERROR_MESSAGE
    else
      puts 'List of people:'
      @people.each { |person| puts person }
    end
  end
end
