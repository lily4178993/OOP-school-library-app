require_relative '../../src/utils/person'
require_relative '../../src/utils/teacher'
require_relative '../../src/utils/student'
require_relative 'students'
require_relative 'teachers'

NO_PEOPLE_ERROR_MESSAGE = 'There is no customer yet! Come later :)'.freeze
  # Display a list of people.
  #
  # Actions:
  # Display a list of people, including their class, name, ID, and age.
  # If there are no one, a corresponding message is printed.
  def list_of_people
    if @people.empty?
      puts NO_PEOPLE_ERROR_MESSAGE
    else
      puts 'List of people:'
      @people.each { |person| puts display_person_info(person) }
    end
  end

  # Helper method to display person information in a formatted way.
  def display_person_info(person)
    "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end

  # Prompts the user to choose between creating a student or a teacher
  # and redirects to the respective creation method.
  #
  # Actions:
  # - Uses a loop to repeatedly display a prompt for the user to choose
  #   *(1) for creating a student
  #   * or (2) for creating a teacher.
  # - Based on the user's choice, calls the appropriate method to create a student or a teacher.
  # - Breaks the loop if a valid choice is made.
  def create_person
    loop do
      print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
      user_choice = gets.chomp.to_i

      if user_choice == 1
        create_student
        break
      elsif user_choice == 2
        create_teacher
        break
      else
        puts 'Invalid input. Please enter either 1 for student or 2 for teacher.'
      end
    end
  end
