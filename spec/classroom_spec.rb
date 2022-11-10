require_relative '../src/classroom'
describe Classroom do
  describe Classroom.new 'Biology' do
    it { is_expected.to have_attributes(label: 'Biology') }
  end
  before(:each) do
    @classroom = Classroom.new('History')
  end
  it 'validating that returns a class instance' do
    expect(@classroom).to be_instance_of(Classroom)
  end
  it 'validating that only accepts one argument' do
    expect { Classroom.new('Phsysics', 'Biology') }.to raise_error(ArgumentError)
  end
  it 'validating parameters' do
    expect(@classroom.label).to eq('History')
  end
end




