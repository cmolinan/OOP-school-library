# Create class Person with the following:
# Instance vars: @id, @name, and @age.
# Getters for @id, @name, and @age.
# Setters for @name and @age.
# Constructor with name, age, and parent_permission as parameter. name and parent_permission
#   are optional and have default values of "Unknown" and true.
# Private method is_of_age? that returns true if @age is greater or equal to 18 and false otherwise.
# Public method can_use_services? that returns true if person is of age or if they have permission from parents.

require_relative 'deco_classes'
require_relative 'rental'
# Turn your Person class to Nameable
# Make sure that your Person class inherits from Nameable
class Person < Nameable
  # Getter and Setter
  attr_accessor :name, :age, :rentals

  # Getter
  attr_reader :id, :parent_permission

  # Constructor
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  # Make sure that this class has a method correct_name implemented.
  # It should simply return the name attribute.
  def correct_name
    @name
  end

  # Private Method
  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || parent_permission
  end

  # -Create the has-many side of Person and Rental (a person has many rentals).
  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  private :of_age?
end

# # See your decorators in action
# # Try the following code and check if you managed to decorate your person:
# person = Person.new(22, 'maximilianus')
# puts person.correct_name
# # maximilianus

# capitalized_person = CapitalizeDecorator.new(person)
# puts capitalized_person.correct_name
# # Maximilianus

# capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# puts capitalized_trimmed_person.correct_name
# # Maximilian
