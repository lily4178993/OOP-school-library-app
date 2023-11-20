# Helper method to get user input for a specified prompt.
#
  # Parameters:
  # - prompt: A string representing the prompt message to display.
  #
  # Returns: The user input after stripping leading and trailing whitespaces.
  def get_user_input(prompt = nil)
    print "#{prompt}: " if prompt
    input = gets.chomp.strip
    validate_input(input)
  end


# Helper method to get a positive integer input from the user.
  #
  # Parameters:
  # - prompt: A string representing the prompt message to display.
  #
  # Returns: A positive integer entered by the user.
  def get_positive_integer_input(prompt = nil)
    input = get_user_input(prompt)
    validate_positive_integer(input)
  end