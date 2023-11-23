require 'securerandom'
require_relative '../interfaces/nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  # Initialize a new Person instance.
  #
  # Parameters:
  # - age: The age of the person.
  # - name: The name of the person (default is 'Unknown').
  # - parent_permission: Permission from parents (default is true).
  #
  # Actions:
  # - Call the parent class's constructor with additional parameters.
  # - Set up the unique ID for the person.
  # - Initialize an empty array for rentals.
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  private

  # method for generating a unique ID.
  def generate_id
    SecureRandom.uuid
  end

  # method that returns `true` if `@age` is greater or equal to 18
  # and `false` otherwise.
  def of_age?
    @age >= 18
  end

  public

  # method that returns `true` if person is of age
  # or if they have permission from parents.
  def can_use_services?
    of_age? || @parent_permission
  end

  # Overrides the correct_name method from the Nameable abstract class.
  # Returns the name attribute of the Person, providing the correct name.
  def correct_name
    @name
  end

  # - Adds the created Rental to the person's list of rentals.
  # Returns: The newly created Rental instance.
  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end
