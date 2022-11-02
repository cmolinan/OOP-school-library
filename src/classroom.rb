# Create a class Classroom with the following:
#   -@label instance variable, should be initialized in the constructor.
#   -Setter and getter for @label (remember about attr_accessor).

class Classroom
  attr_accessor :label
  attr_reader :student

  def initialize(label)
    @label = label
    @student = []
  end

  # Make sure that when adding a student to a classroom it also
  # sets the classroom for the student.
  def add_student=(student)
    @student.push(student)
    student.classroom = self
  end
end
