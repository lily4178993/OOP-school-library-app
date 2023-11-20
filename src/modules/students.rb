STUDENT_CREATION_SUCCESS_MESSAGE = 'Student created successfully'.freeze
STUDENT_CREATION_FAILURE_MESSAGE = 'The student cannot use services.'.freeze

# Prompts the user to enter information for creating a student.
#
# Actions:
# - Asks the user for the student's age and name.
# - Utilizes the get_positive_integer_input method to ensure a positive integer for age.
# - Uses get_user_input to get the student's name.
# - Prompts the user for parent permission using the input_parent_permission method.
# - Creates a new Student instance with the provided information.
# - Checks if the student can use services and adds them to the people array if successful.
# - Outputs a success message if the student is created; otherwise, outputs a failure message.
def create_student
  print 'Age: '
  age = get_positive_integer_input
  print 'Name: '
  name = get_user_input
  parent_permission = input_parent_permission

  new_student = Student.new(age, parent_permission, name)

  if new_student.can_use_services?
    @people << new_student
    puts STUDENT_CREATION_SUCCESS_MESSAGE
  else
    puts STUDENT_CREATION_FAILURE_MESSAGE
  end
end
