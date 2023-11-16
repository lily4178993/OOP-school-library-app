require_relative '../interfaces/nameable'

# Create a base decorator that includes the Nameable interface
class BaseDecorator < Nameable
  attr_accessor :nameable

  # Constructor that assigns a nameable object from params to
  # an instance variable.
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  # method that returns the result of the correct_name method
  # of the @nameable.
  def correct_name
    @nameable.correct_name
  end
end
