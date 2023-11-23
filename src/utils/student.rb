require_relative 'person'

class Student < Person
  attr_reader :classroom
  attr_accessor :category

  # Initialize a new Student instance.
  #
  # Parameters:
  # - age: The age of the student.
  # - classroom: The classroom the student belongs to.
  # - name: The name of the student (default is 'Unknown').
  # - parent_permission: Permission from parents (default is true).
  #
  # Actions:
  # - Call the parent class's constructor with additional parameters.
  # - Set the classroom for the student.
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    @category = 'Student'
  end

  # Simulate a student playing hooky.
  # - Print the string "¯\(ツ)/¯" to represent playing hooky.
  def play_hooky
    print '¯\(ツ)/¯'
  end

  # - Set the classroom for the student.
  # - Add the student to the classroom's students.
  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def to_json(options = {})
    {
      id: id,
      name: name,
      age: age,
      parent_permission: @parent_permission,
      category: category,
      classroom: classroom
    }.to_json(options)
  end
end
