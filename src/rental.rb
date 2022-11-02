# Create a class Rental with the following:
# -@date instance variable, should be initialized in the constructor.
# -Setter and getter for @date (remember about attr_accessor).

# -Create the has-many side of Book and Rental (a book has many rentals).
# -Create the has-many side of Person and Rental (a person has many rentals).
# -Create the belongs-to side of Rental and Person (a rental belongs to a person).

# Modify the constructor of Rental so Book and Person are set in it.
class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(date, book, person)
    @book = book
    book.rentals << self

    @person = person
    person.rentals << self

    @date = date
  end
end
