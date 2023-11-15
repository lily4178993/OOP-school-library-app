require_relative 'person'

class Student < Person
  attr_accessor :classroom # Generates getters and setters

  # Constructor initialization
  # extends parent's constructor by adding `@classroom` and a parameter for it.
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  # Method play_hooky that returns the string "¯\(ツ)/¯"
  def play_hooky
    print '¯\(ツ)/¯'
  end
end
