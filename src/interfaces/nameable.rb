# Nameable is a class designed to be used as an abstract class or interface.
class Nameable
  # Abstract method that should be implemented by subclasses.
  # Raises an error if called directly on Nameable.
  def correct_name
    raise NotImplementedError, "#{self.class} must implement the method '#{__method__}'"
  end
end
