require_relative '../src/teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new('Biology', 41, 'Martha Ross')
  end

  it 'validating that returns a class instance' do
    expect(@teacher).to be_instance_of(Teacher)
  end

  it 'validating inherits methods from Person class' do
    expect(@teacher.can_use_services?).to be true
  end

  it 'validating parameters' do
    expect(@teacher.age).to be(41)
    expect(@teacher.age).not_to be(10)
    expect(@teacher.specialization).to eq('Biology')
    expect(@teacher.name).to eq('Martha Ross')
  end
end
