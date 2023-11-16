require_relative 'base_decorator'

class CapitalizeDecorator < BaseDecorator
  # method that capitalizes the output
  def correct_name
    @nameable.correct_name.capitalize
  end
end
