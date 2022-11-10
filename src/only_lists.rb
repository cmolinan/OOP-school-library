require 'pry'
require_relative 'person'
require_relative 'book'
require_relative 'rental'

class Lists
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
