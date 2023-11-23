require_relative 'person'

class Teacher < Person
  attr_accessor :specialization, :category

  # Constructor initialization
  # extends Person's constructor by adding `@specialization` and a parameter for it.
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
    @category = 'Teacher'
  end

  # Overrided method from `Person` that always return true
  def can_use_services?
    true
  end

  def to_json(options = {})
    {
      id: id,
      name: name,
      age: age,
      parent_permission: @parent_permission,
      specialization: specialization,
      category: category
    }.to_json(options)
  end
end
