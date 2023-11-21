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
    # load_data
  end

  def create_a_person
    create_person
  end

  def create_a_rental
    create_rental
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

  #   # Save data to JSON files on exit
  #   def save_data
  #     save_to_json('books.json', @books)
  #     save_to_json('people.json', @people)
  #     save_to_json('rentals.json', @rentals)
  #   end

  #   private

  #   # Helper method to save data to a JSON file
  #   def save_to_json(file_name, data)
  #     File.open(file_name, 'w') do |file|
  #       file.puts JSON.dump(data)
  #     end
  #   end

  #   # Helper method to load data from a JSON file
  #   def load_from_json(file_name)
  #     JSON.parse(File.read(file_name)) if File.exist?(file_name)
  #   end

  #   # Helper method to load all data from JSON files
  #   def load_data
  #     @books = load_from_json('books.json') || []
  #     @people = load_from_json('people.json') || []
  #     @rentals = load_from_json('rentals.json') || []
  #   end
end
