# menu.rb
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
  when 1 then app.list_all_books
  when 2 then app.list_all_people
  when 3 then app.create_a_book
  when 4 then app.create_a_person
  when 5 then app.create_a_rental
  when 6 then app.list_all_rentals_per_person
  end
end
