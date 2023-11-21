require_relative '../app'

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
  actions = {
    1 => :list_all_books,
    2 => :list_all_people,
    3 => :create_a_book,
    4 => :create_a_person,
    5 => :create_a_rental,
    6 => :list_all_rentals_per_person,
    7 => :exit_application
  }

  action = actions[input]

  if action
    app.send(action)
  else
    puts 'Invalid input. Please choose a valid number.'
  end
end

def exit_application
  @app.save_data if @app
  puts 'Exiting the App. Goodbye!'
  exit
end

# Handle missing files during startup
begin
  @app = App.new
rescue StandardError => e
  puts "Error during startup: #{e.message}"
  e.backtrace.each { |line| puts line }
  exit
end

# Main loop
loop do
  app_menu
  user_input = gets.chomp.to_i
  take_action(@app, user_input)
end
