require_relative 'src/app'

MENU_OPTIONS = {
  1 => 'List all books',
  2 => 'List all people',
  3 => 'Create a book',
  4 => 'Create a person',
  5 => 'Create a rental',
  6 => 'List all rentals for a given person id',
  7 => 'Exit'
}.freeze

def app_menu
  puts "\nWelcome to School Library App!\n\n"
  MENU_OPTIONS.each { |key, value| puts "#{key} - #{value}" }
  print 'Enter a number: '
end

def take_action(app, input)
  case input
  when 1 then app.list_of_books
  when 2 then app.list_of_people
  when 3 then app.create_book
  when 4 then app.create_person
  when 5 then app.create_rental
  when 6 then app.list_of_rentals_per_person
  end
end

def main
  app = App.new
  input = nil

  until input == 7
    app_menu
    input = gets.chomp.to_i

    unless MENU_OPTIONS.key?(input)
      puts 'Invalid option. Please choose a number from the menu!'
      next
    end

    take_action(app, input)
  end
end

main
