require_relative 'only_creates'
require_relative 'only_lists'
require_relative 'storage'
require_relative 'mock_data'

db = { books: [], persons: [], rentals: [] }

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
  lists = Lists.new
  creates = Creates.new
  mockdata = MockData.new
  storage = Storage.new
  storage.restore_all(db_data)
  loop do
    case menu_display
    when '1'
      lists.list_all_books(db_data[:books])
    when '2'
      lists.list_all_people(db_data[:persons])
    when '3'
      creates.create_person(db_data[:persons])
    when '4'
      creates.create_book(db_data[:books])
    when '5'
      creates.create_rental(db_data)
    when '6'
      lists.list_rentals(db_data[:persons])
    when '7'
      storage.save_all(db_data)
      puts "\nSaving the database!\n"
      puts "\nThank you for using this app!\n\n"
      return
    when '88'
      mockdata.init_books_and_persons(db_data[:books], db_data[:persons])
    when '99'
      storage.save_all(db_data)
    when '100'
      storage.restore_all(db_data)
    else
      puts "\nSelection not valid"
    end
  end
end

main(db)
