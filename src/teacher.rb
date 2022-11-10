# Create class Teacher with the following:
# Inherits from Person.
# Constructor extends parent's constructor by adding @specialization and a parameter for it.
# Override can_use_services? so it always returns true.

require_relative 'person'

class Teacher < Person
  # Constructor
  def initialize(specialization, age, name = 'Unknown')
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
