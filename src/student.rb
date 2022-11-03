# Create class Student with the following:
# Inherits from Person.
# Constructor extends parent's constructor by adding @classroom and a parameter for it.
# Method play_hooky that returns "¯\(ツ)/¯".

require_relative 'person'

class Student < Person
  attr_reader :classroom

  # Constructor
  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = nil
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  # Make sure that when setting the classroom for a student it also
  # adds it to the classrooms' students.
  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end
end
