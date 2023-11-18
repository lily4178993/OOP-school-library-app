class Book
  attr_accessor :title, :author, :rentals

  # Initialize a new Book instance.
  #
  # Parameters:
  # - title: The title of the book.
  # - author: The author of the book.
  #
  # Actions:
  # - Set the title, author, and an empty array for rentals.
  #
  # Returns: An instance of Book.
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  # Add a rental to the book's rentals.
  #
  # Parameters:
  # - person: The person renting the book.
  # - date: The date of the rental.
  #
  # Actions:
  # - Create a new rental with the provided person, date, and the book itself.
  # - Add the rental to the book's rentals unless it's already included.
  #
  # Returns: None.
  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
