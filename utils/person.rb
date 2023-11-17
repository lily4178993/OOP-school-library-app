require 'securerandom'
require_relative '../interfaces/nameable'

class Person < Nameable
  attr_reader :id, :rentals # Generates getters
  attr_accessor :name, :age # Generates getters and setters

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
  #
  # Returns: An instance of Person.
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

  # Add a rental record to the person.
  #
  # Parameters:
  # - rental: The rental object to be added.
  #
  # Actions:
  # - Add the rental to the person's rentals.
  # - Set the person for the rental.
  #
  # Returns: None.
  def add_rental(rental)
    @rentals << rental
    rental.person = self
  end
end
