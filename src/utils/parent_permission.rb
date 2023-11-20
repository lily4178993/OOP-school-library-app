PARENT_PERMISSION_MESSAGE = 'Has parent permission? [Y/N]: '.freeze

# Helper method to get user input for parent permission.
#
# Returns: true if the user enters 'Y', false if 'N', and prompts for a valid input otherwise.
def input_parent_permission
  loop do
    print PARENT_PERMISSION_MESSAGE
    user_choice = get_user_input.strip.capitalize

    return true if user_choice == 'Y'
    return false if user_choice == 'N'

    puts INVALID_INPUT_ERROR_MESSAGE
  end
end
