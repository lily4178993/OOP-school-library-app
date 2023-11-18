load './src/utils/book.rb'
load './src/utils/person.rb'
load './src/utils/student.rb'
load './src/utils/teacher.rb'
load './src/utils/rental.rb'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # Display a list of books.
  #
  # Actions:
  # - Checks if the list of books is empty and provides a corresponding message.
  # - If books are present, prints a numbered list of book titles and authors.
  def list_of_books
    if @books.empty?
      puts 'There are no books here! Come later :)'
    else
      puts 'List of books:'
      @books.each_with_index do |book, index|
        puts "#{index + 1}. Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  # Display a list of people.
  #
  # Actions:
  # Display a list of people, including their class, name, ID, and age.
  # If there are no one, a corresponding message is printed.
  def list_of_people
    if @people.empty?
      puts 'There is no customer yet! Come later :)'
    else
      puts 'List of people:'
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  # Displays a list of rentals associated with a specific person based on their ID.
  #
  # Actions:
  # - Checks if there are any rentals available.
  # - Prompts the user to enter a person ID.
  # - Filters rentals based on the entered person ID.
  # - Displays rental details for the selected person, if found.
  # - Provides feedback if no rentals or matching person ID is found.
  def list_of_rentals_per_person
    if @rentals.empty?
      puts 'No books were rented so far :('
    else
      print 'Enter the person ID: '
      person_id = gets.chomp.strip

      if person_id.size <= 0
        puts 'Invalid input. Please enter a valid person ID.'
        return
      end

      selected_rentals = @rentals.select { |rental| rental.person.id == person_id }

      if selected_rentals.empty?
        puts "\nNo rentals found for person with ID #{person_id}."
      else
        puts "\nRentals:"
        selected_rentals.each do |rental|
          puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
        end
      end
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp.strip
    print 'Author: '
    author = gets.chomp.strip

    if title.empty? || author.empty?
      puts 'Invalid input. Title and author cannot be empty.'
      return
    end

    @books << Book.new(title, author)
    puts 'Book created successfully'
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

  # Prompts the user to enter information for creating a teacher.
  #
  # Actions:
  # - Prompts the user for age, name, and whether they have parent permission.
  # - Creates a new teacher instance based on the entered information.
  # - Adds the created teacher to the people array.
  # - Displays a success message.
  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.strip
    print 'Specialization: '
    specialization = gets.chomp.strip

    new_teacher = Teacher.new(age, specialization, name)
    if new_teacher.can_use_services?
      @people << new_teacher
      puts 'Teacher created successfully'
    else
      puts 'The teacher cannot use services.'
    end
  end

  # Prompts the user to enter information for creating a student.
  #
  # Actions:
  # - Prompts the user for age, name, and whether they have parent permission.
  # - Creates a new student instance based on the entered information.
  # - Adds the created student to the people array if they can use services.
  # - Displays a success message or an error message if the student can't use services.
  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.strip
    parent_permission = input_parent_permission

    new_student = Student.new(age, name, parent_permission)

    if new_student.can_use_services?
      @people << new_student
      puts 'Student created successfully'
    else
      puts 'The student cannot use services.'
    end
  end

  # Prompts the user to create a rental, ensuring there are available books and people.
  # Displays a list of books and people for selection, then creates a rental with the chosen book and person.
  # Outputs success message after creating the rental.
  def create_rental
    return puts 'No books or people available! Cannot create a rental.' if @books.empty? || @people.empty?

    book_index = select_book
    person_index = select_person

    return unless book_index && person_index

    print 'Date: '
    date = gets.chomp.strip

    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
  end

  private

  # Helper method to get user input for parent permission.
  def input_parent_permission
    loop do
      print 'Has parent permission? [Y/N]: '
      user_choice = gets.chomp.strip.capitalize

      return true if user_choice == 'Y'
      return false if user_choice == 'N'

      puts 'Invalid input. Please enter either Y or N.'
    end
  end

  # Displays a list of books with their titles and authors, allowing the user to select one by number.
  # Returns the index of the selected book or nil if the selection is invalid.
  def select_book
    display_options('book', @books)
  end

  # Displays a list of people with their information, allowing the user to select one by number.
  # Returns the index of the selected person or nil if the selection is invalid.
  def select_person
    display_options('person', @people)
  end

  # Displays a list of options (books or people) with their information, allowing the user to select one by number.
  # Returns the index of the selected option or nil if the selection is invalid.
  def display_options(type, options)
    puts "Select a #{type} from the following list by number:"
    options.each_with_index do |option, index|
      puts "#{index}) #{display_info(type, option)}"
    end

    index = gets.chomp.to_i

    return index if (0...options.length).cover?(index)

    puts "Invalid #{type} selection. Please choose a valid number."
  end

  # Returns a formatted string with the information of the given option (book or person).
  def display_info(type, option)
    case type
    when 'book'
      "Title: \"#{option.title}\", Author: #{option.author}"
    when 'person'
      "[#{option.class}] Name: #{option.name}, ID: #{option.id}, Age: #{option.age}"
    end
  end
end
