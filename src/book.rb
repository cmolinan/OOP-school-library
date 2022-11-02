# Create a class Book with the following:
# -@title and @author instance variables, should be initialized in the
# constructor.
# -Setters and getters for instance variables (remember about attr_accessor).

# -Create the has-many side of Book and Rental (a book has many rentals).
require_relative 'rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  # Create the belongs-to side of Rental and Book (a rental belongs to a book).
  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
