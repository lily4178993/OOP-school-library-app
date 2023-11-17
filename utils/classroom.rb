class Classroom
  attr_accessor :label # Generates getters and setters
  attr_reader :students

  # Initialize a new Classroom instance.
  #
  # Parameters:
  # - label: The label or name of the classroom.
  #
  # Actions:
  # - Set the label and initialize an empty array for students.
  #
  # Returns: An instance of Classroom.
  def initialize(label)
    @label = label
    @students = []
  end

  # Add a student to the classroom.
  #
  # Parameters:
  # - student: The student to be added.
  #
  # Actions:
  # - Add the student to the classroom's students.
  # - Set the classroom for the student.
  #
  # Returns: None.
  def add_student(student)
    @students << student unless @students.include?(student)
    student.classroom = self
  end
end
