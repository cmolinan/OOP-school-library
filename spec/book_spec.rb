require_relative '../src/book'
describe Book do
  describe Book.new 'Game of thrones', 'George Martin' do
    it { is_expected.to have_attributes(title: 'Game of thrones') }
    it { is_expected.to have_attributes(author: 'George Martin') }
  end
  before(:each) do
    @book = Book.new('Lord of the rings', 'Tolkien')
  end
  it 'validating if returns a class instance' do
    expect(@book).to be_instance_of(Book)
  end
  it 'validating parameters' do
    expect(@book.title).to eq('Lord of the rings')
    expect(@book.author).not_to eq('John Smith')
  end
  it 'validating that only accepts two arguments' do
    expect { Book.new('The King', 'John Wayne', 'AK Press') }.to raise_error(ArgumentError)
  end
  it 'validating if not have any rentals' do
    expect(@book.rentals.length).to eq(0)
    expect(@book.rentals).to eq([])
  end
end