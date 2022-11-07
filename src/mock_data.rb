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
  end
end
