class Book
  attr_accessor :title, :author, :rentals

  # Initialize a new Book instance.
  # - Set the title, author, and an empty array for rentals.
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  # Add a rental to the book's rentals.
  # - Create a new rental with the provided person, date, and the book itself.
  def add_rental(date, person)
    Rental.new(date, self, person)
  end

  def to_json(options = {})
    {
      title: title,
      author: author
    }.to_json(options)
  end
end
