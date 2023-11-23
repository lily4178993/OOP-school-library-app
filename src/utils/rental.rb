class Rental
  attr_accessor :date, :book, :person

  # Initialize a new Rental instance.
  # - Set the rental date, book, and person.
  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def to_json(options = {})
    {
      date: date,
      book: @book,
      person: @person
    }.to_json(options)
  end
end
