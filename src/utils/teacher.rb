require_relative 'person'

class Teacher < Person
  attr_accessor :specialization # Generates getters and setters

  # Constructor initialization
  # extends Person's constructor by adding `@specialization` and a parameter for it.
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  # Overrided method from `Person` that always return true
  def can_use_services?
    true
  end
end
