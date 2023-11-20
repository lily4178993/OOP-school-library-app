TEACHER_CREATION_SUCCESS_MESSAGE = 'Teacher created successfully'.freeze
TEACHER_CREATION_FAILURE_MESSAGE = 'The teacher cannot use services.'.freeze

# Prompts the user to enter information for creating a teacher.
#
# Actions:
# - Asks the user for the teacher's age, name, and specialization.
# - Utilizes the get_positive_integer_input method to ensure a positive integer for age.
# - Uses get_user_input to get the teacher's name and specialization.
# - Creates a new Teacher instance with the provided information.
# - Checks if the teacher can use services and adds them to the people array if successful.
# - Outputs a success message if the teacher is created; otherwise, outputs a failure message.
def create_teacher
  print 'Age: '
  age = get_positive_integer_input
  print 'Name: '
  name = get_user_input
  print 'Specialization: '
  specialization = get_user_input

  new_teacher = Teacher.new(age, specialization, name)
  if new_teacher.can_use_services?
    @people << new_teacher
    puts TEACHER_CREATION_SUCCESS_MESSAGE
  else
    puts TEACHER_CREATION_FAILURE_MESSAGE
  end
end
