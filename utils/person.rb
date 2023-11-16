require_relative '../interfaces/nameable'

class Person < Nameable
  attr_reader :id # Generates getters
  attr_accessor :name, :age # Generates getters and setters

  # Constructor initialization
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
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
end
