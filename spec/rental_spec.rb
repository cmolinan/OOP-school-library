require_relative '../src/rental'
require_relative '../src/book'
require_relative '../src/student'

describe Rental do
  before :each do
    @book = Book.new('The King', 'Richard Harris')
    @student = Student.new(14, 'Martha Ross', parent_permission: true)
    @rental = Rental.new('2022-08-21', @book, @student)
  end

  it 'validating that returns a class instance' do
    expect(@rental).to be_instance_of Rental
  end

  it 'Validating calling arguments' do
    expect(@rental.date).to eq('2022-08-21')
    expect(@rental.book.title).to eq('The King')
    expect(@rental.person.name).to eql('Martha Ross')
  end
end
