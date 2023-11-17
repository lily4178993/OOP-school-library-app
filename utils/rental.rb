class Rental
  attr_accessor :date, :book, :person

  # Initialize a new Rental instance.
  #
  # Parameters:
  # - date: The date of the rental.
  #
  # Actions:
  # - Set the rental date, book, and person.
  # - Add the rental to the book's rentals unless it's already included.
  # - Add the rental to the person's rentals unless it's already included.
  #
  # Returns: An instance of Rental.
  def initialize(date)
    @date = date
    @book = book
    @book.rentals << self unless @book.rentals.include?(self)
    @person.rentals << self unless @person.rentals.include?(self)
  end
end
