require 'pry'
require 'json'
require_relative 'rental'

class Storage
  def initialize
    @path = 'storage/'
    @path_of_books = "#{@path}books.json.txt"
    @path_of_persons = "#{@path}persons.json.txt"
    @path_of_rentals = "#{@path}rentals.json.txt"
  end

  def save_all(db_data)
    FileUtils.rm_f(@path_of_books)
    FileUtils.rm_f(@path_of_persons)
    FileUtils.rm_f(@path_of_rentals)

    save_books(db_data[:books]) unless db_data[:books].empty?
    save_persons(db_data[:persons]) unless db_data[:persons].empty?
    save_rentals(db_data)
  end

  def save_books(books)
    books_to_file = []
    books.each do |book|
      books_to_file << { title: book.title.to_s, author: book.author.to_s }
    end
    File.write(@path_of_books, JSON[books_to_file])
  end

  def save_persons(persons)
    # binding.pry
    persons_to_file = []
    persons.each do |person|
      persons_to_file << {
        class: person.class.to_s,
        id: person.age.to_s,
        age: person.age.to_s,
        name: person.name.to_s,
        parent_permission: person.parent_permission.to_s,
        rentals: person.rentals,
        specialization: person.specialization.to_s
      }
    end
    File.write(@path_of_persons, JSON[persons_to_file])
  end

  def save_rentals(db_data)
    # get the rentals
    db_data[:rentals] = []
    db_data[:persons].each do |person|
      person.rentals.each do |rental|
        # binding.pry
        db_data[:rentals] << [rental.person.name, rental.book.title, rental.date]
      end
    end

    return if db_data[:rentals].empty?

    rentals_to_file = []
    db_data[:rentals].each do |rental|
      rentals_to_file << {
        name: rental[0].to_s,
        title: rental[1].to_s,
        date: rental[2].to_s
      }
    end
    File.write(@path_of_rentals, JSON[rentals_to_file])

    # binding.pry
  end

  def restore_all(db_data)
    # restore Books
    file = File.open(@path_of_books, 'a+')
    dataread = file.size.zero? ? [] : JSON.parse(file.read)
    dataread.each do |book|
      db_data[:books] << Book.new(book['title'], book['author'])
    end
    file.close

    # restore Persons
    file = File.open(@path_of_persons, 'a+')
    dataread = file.size.zero? ? [] : JSON.parse(file.read)
    dataread.each do |person|
      db_data[:persons] <<
        if person['class'] == 'Student'
          # binding.pry
          Student.new(person['age'].to_i, person['name'], parent_permission: person['parent_permission'])
        else
          Teacher.new(person['specialization'], person['age'].to_i, person['name'])
        end
    end
    file.close

    # restore Rentals
    file = File.open(@path_of_rentals, 'a+')
    dataread = file.size.zero? ? [] : JSON.parse(file.read)
    dataread.each do |rental|
      db_data[:rentals] << [rental['name'], rental['title'], rental['date']]
    end
    file.close

    restore_rentals(db_data)
  end

  def restore_rentals(db_data)
    db_data[:rentals].each do |rental|
      p_index = get_person_index(rental[0], db_data)
      b_index = get_book_index(rental[1], db_data)
      date = rental[2]
      # generate a rent of book
      db_data[:persons][p_index].add_rental(db_data[:books][b_index], date)
    end
  end
  def get_person_index(name, db_data)
    db_data[:persons].select.with_index do |person, index|
      return index if person.name == name
    end
  end
  def get_book_index(title, db_data)
    db_data[:books].select.with_index do |book, index|
      return index if book.title == title
    end
  end
end
