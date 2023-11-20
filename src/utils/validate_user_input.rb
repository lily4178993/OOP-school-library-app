INVALID_INPUT_ERROR_MESSAGE = 'Invalid input. Please enter a valid value.'.freeze

# Helper method for generic input validation to avoid code duplication.
#
# Parameters:
# - input: The user input to be validated.
#
# Returns: The user input if the validation is successful.
def validate_input(input)
  return input unless input.empty?

  puts INVALID_INPUT_MESSAGE
  get_user_input
end

# Helper method to validate whether the input is a positive integer.
#
# Parameters:
# - input: The user input to be validated.
#
# Returns: The positive integer if the validation is successful; otherwise, prompts the user for a valid input.
def validate_positive_integer(input)
  return input.to_i if input.match?(/^\d+$/) && input.to_i.positive?

  puts INVALID_INPUT_ERROR_MESSAGE
  get_positive_integer_input
end
