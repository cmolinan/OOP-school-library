# Create class Person with the following:
# Instance vars: @id, @name, and @age.
# Getters for @id, @name, and @age.
# Setters for @name and @age.
# Constructor with name, age, and parent_permission as parameter. name and parent_permission
#   are optional and have default values of "Unknown" and true.
# Private method is_of_age? that returns true if @age is greater or equal to 18 and false otherwise.
# Public method can_use_services? that returns true if person is of age or if they have permission from parents.

class Person
  # Getter and Setter
  attr_accessor :name, :age

  # Getter
  attr_reader :id

  # Constructor
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  # Private Method
  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || parent_permission
  end

  private :of_age?
end
