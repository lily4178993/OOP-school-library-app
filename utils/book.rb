class Book
  attr_accessor :title, :author
  attr_reader :rentals

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
  # - rental: The rental to be added.
  #
  # Actions:
  # - Add the rental to the book's rentals unless it's already included.
  # - Set the book for the rental.
  #
  # Returns: None.
  def add_rental(rental)
    @rentals << rental unless @rentals.include?(rental)
    rental.book = self
  end
end
