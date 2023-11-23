require_relative '../src/modules/people'
require_relative '../src/modules/books'
require_relative '../src/modules/rentals'
require_relative '../src/modules/data_loader_saver'
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
    create_person
    save_data
  end

  def create_a_rental
    create_rental
    save_data
  end

  def create_a_book
    create_book
    save_data
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
    ensure_data_directory
    save_to_json('src/data/books.json', @books)
    save_to_json('src/data/people.json', @people)
    save_to_json('src/data/rentals.json', @rentals)
  end

  def load_data
    @books = load_from_json('src/data/books.json') || []
    @people = load_from_json('src/data/people.json') || []
    @rentals = load_from_json('src/data/rentals.json') || []
  end
end
