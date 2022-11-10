require_relative 'person'

class MockData
  def init_books_and_persons(db_books, db_persons)
    puts "\nBOOKS AND PERSONS ADDED !"
    db_books << Book.new('The King', 'Richard Harris')
    db_books << Book.new('Sophie', 'Mark Twain')
    db_books << Book.new('The Cure', 'Fred Winnipeg')

    db_persons << Teacher.new('Biology', 41, 'Martha Ross')
    db_persons << Teacher.new('History', 33, 'John Matheus')

    db_persons << Student.new(21, 'Richard', parent_permission: true)
    db_persons << Student.new(14, 'Mary', parent_permission: false)

    # Rentals
    db_persons[0].add_rental(db_books[0], '2022/01/02') # Martha, The King
    db_persons[1].add_rental(db_books[1], '2022/02/03') # John, Sophie
    db_persons[2].add_rental(db_books[2], '2022/03/22') # Richard, The Cure
    db_persons[3].add_rental(db_books[0], '2022/02/21') # Mary, The King
    db_persons[3].add_rental(db_books[1], '2022/01/18') # Mary, Sophie
  end
end
