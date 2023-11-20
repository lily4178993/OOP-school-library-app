require_relative 'src/app'
require_relative 'src/utils/menu'

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
