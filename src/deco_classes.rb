# Create a class Nameable.
class Nameable
  # Implement a method called correct_name that will raise a # NotImplementedError.
  def correct_name
    raise NotImplementedError
  end
end

# Prepare base Decorator. Make sure that it inherits from Nameable.
class BaseDecorator < Nameable
  # In the constructor assign a nameable object from params to an instance variable.
  def initialize(nameable)
    super()
    @name = nameable
  end

  # Implement the correct_name method that returns the result of the correct_name method of the @nameable.
  def correct_name
    @name.correct_name
  end
end

# Prepare TrimmerDecorator CapitalizeDecorator
# Create a class that inherits from the base Decorator class.
class CapitalizeDecorator < BaseDecorator
  # Implement a method correct_name that capitalizes
  # the output of  # @nameable.correct_name.
  def correct_name
    @name.correct_name.capitalize
  end
end

# Prepare TrimmerDecorator
# Create a class that inherits from the base Decorator class.
class TrimmerDecorator < BaseDecorator
  # Implement a method correct_name that makes sure that the output # of @nameable.correct_name
  # has a maximum of 10 characters. If # it's longer it should trim the word.
  def correct_name
    tmp = @name.correct_name
    tmp[0...10] if tmp.length >= 10
  end
end
