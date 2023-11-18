require_relative 'person'

class Student < Person
  attr_reader :classroom # Generates getters and setters

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
  #
  # Returns: An instance of Student.
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  # Simulate a student playing hooky.
  #
  # Actions:
  # - Print the string "¯\(ツ)/¯" to represent playing hooky.
  #
  # Returns: None.
  def play_hooky
    print '¯\(ツ)/¯'
  end

  # Set the classroom for the student.
  #
  # Parameters:
  # - classroom: The classroom the student belongs to.
  #
  # Actions:
  # - Set the classroom for the student.
  # - Add the student to the classroom's students.
  #
  # Returns: None.
  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
