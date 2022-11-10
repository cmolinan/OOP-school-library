require_relative '../src/person'

describe Person do
  describe Person.new 27, 'John Smith' do
    it { is_expected.to have_attributes(age: 27) }
    it { is_expected.to have_attributes(name: 'John Smith') }
    it { is_expected.to have_attributes(parent_permission: true) }
  end

  before(:each) do
    @person = Person.new(27, 'John Smith', parent_permission: false)
  end

  it 'validating that returns a class instance' do
    expect(@person).to be_instance_of(Person)
  end

  it 'validating parameters' do
    expect(@person.age).to be(27)
    expect(@person.age).not_to be(15)
    expect(@person.name).to eq('John Smith')
    expect(@person.parent_permission).not_to be true
  end

  it 'validating if person can use services' do
    @person.age = 17
    expect(@person.can_use_services?).to be false
  end
end
