require_relative 'app'
db = { books: [], persons: [] }

puts "\nWelcome to School Library App"

def menu_display
  puts "\nPlease choose an option by entering a number:
1 - List all books
2 - List all people
3 - Create a person
4 - Create a book
5 - Create a rental
6 - List all rentals for a given person id
7 - Exit"
  gets.chomp
end

def main(db_data)
  app = App.new
  case menu_display
  when '1'
    app.list_all_books(db_data[:books])
  when '2'
    app.list_all_people(db_data[:persons])
  when '3'
    app.create_person(db_data[:persons])
  when '4'
    app.create_book(db_data[:books])
  when '5'
    app.create_rental(db_data)
  when '6'
    app.list_rentals(db_data[:persons])
  when '7'
    puts "\nThank you for using this app!\n\n"
    return
  when '88'
    app.init_books_and_persons(db_data[:books], db_data[:persons])
  else
    puts "\nSelection not valid"
  end
  main(db_data)
end

main(db)