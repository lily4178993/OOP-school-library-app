require_relative '../../src/utils/person'
require_relative '../../src/utils/teacher'
require_relative '../../src/utils/student'
require_relative 'students'
require_relative 'teachers'

NO_PEOPLE_ERROR_MESSAGE = 'There is no customer yet! Come later :)'.freeze

def list_of_people
  if @people.empty?
    puts NO_PEOPLE_ERROR_MESSAGE
  else
    puts 'List of people:'
    @people.each { |person| puts display_person_info(person) }
  end
end

def display_person_info(person)
  if person.is_a?(Person)
    "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  else
    "[#{person.class}] #{person}"
  end
end

def create_teacher_or_student
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
