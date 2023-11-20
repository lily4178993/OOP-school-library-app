require_relative '../src/modules/people'
require_relative '../src/modules/books'
require_relative '../src/modules/rentals'
require_relative '../src/utils/get_user_input'
require_relative '../src/utils/validate_user_input'
require_relative '../src/utils/parent_permission'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
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
end
