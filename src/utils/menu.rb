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
  action_mapping = {
    1 => :list_all_books,
    2 => :list_all_people,
    3 => :create_a_book,
    4 => :create_a_person,
    5 => :create_a_rental,
    6 => :list_all_rentals_per_person,
    7 => :save_data
  }

  action = action_mapping[input]
  app.public_send(action) if action
end
