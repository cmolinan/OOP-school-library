require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

class App
  def list_all_books(db_books)
    puts "\nNo books available yet" if db_books.empty?
    puts
    db_books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def list_all_people(db_persons)
    puts "\nNo people available yet" if db_persons.empty?
    puts
    db_persons.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_book(db_books)
    print "\nTitle: "
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    if title.strip != '' && author.strip != ''
      book = Book.new(title, author)
      db_books << book
      puts "\nBook created successfully"
    else
      puts "\nMust enter title and author to create a book"
    end
  end

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

  def create_person(db_persons)
    print "\nDo you want to create a student (1) or a teacher (2)? [Input the number]: "
    person_type = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp

    case person_type
    when '2'
      create_teacher(db_persons, name, age)
    when '1'
      create_student(db_persons, name, age)
    else
      puts "\nInvalid person type selected"
    end
  end

  def create_teacher(db_persons, name, age)
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    db_persons << teacher
    puts "\nTeacher created successfully"
  end

  def create_student(db_persons, name, age)
    print 'Has parent permission? [Y/N]: '
    has_permission = gets.chomp.downcase
    student = ''
    case has_permission
    when 'y'
      student = Student.new(age, name, parent_permission: true)
    when 'n'
      student = Student.new(age, name, parent_permission: false)
    else
      puts "\ninvalid selection for permission"
      return
    end
    db_persons << student
    puts "\nStudent created successfully"
  end

  def create_rental(db_data)
    if db_data[:books].empty? == true || db_data[:persons].empty? == true
      puts "\nNo books or people registered for rent"
      return
    end

    puts "\nSelect a book from the following list by number"

    db_data[:books].each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end

    book_index = gets.chomp.to_i
    book_selected = db_data[:books][book_index]

    puts "\nSelect a person from the following list by number"

    db_data[:persons].each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    person_selected = db_data[:persons][person_index]

    print 'Date (yyyy/mm/dd): '
    date = gets.chomp

    person_selected.add_rental(book_selected, date)
    puts "\nRental created successfully for #{person_selected.name}"
  end

  def list_rentals(db_persons)
    if db_persons.empty?
      puts "\nNo one has rented yet"
      return
    end
    print "\nID of the person: "
    person_id = gets.chomp.to_i
    person_fetch = db_persons.select { |person| person.id == person_id }

    if person_fetch[0]&.id
      puts "\nRentals: "
      found = false
      person_fetch[0].rentals.each do |rental|
        found = true unless rental.person.name == ''
        print "Person: #{rental.person.name}, Date: #{rental.date}, "
        puts "Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
      puts "#{person_fetch[0].name} didn't rent a book" unless found
    else
      puts "\nID not exists"
    end
  end
end
