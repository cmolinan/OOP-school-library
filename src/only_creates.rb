require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'
require_relative 'person'

class Creates
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
end
