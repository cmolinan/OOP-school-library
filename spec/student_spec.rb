require_relative '../src/student'
require_relative '../src/classroom'

describe Student do
  before :each do
    @student = Student.new(14, 'Mary Poppins', parent_permission: true)
  end

  it 'validating that returns a class instance' do
    expect(@student).to be_instance_of(Student)
  end

  it 'validating inherits methods from Person class' do
    expect(@student.can_use_services?).to be true
  end

  it 'validating name is Mary Poppins' do
    expect(@student.name).to eq('Mary Poppins')
  end

  it 'validating if student belongs to a classroom' do
    classroom = Classroom.new('Biology')
    @student.classroom = classroom
    expect(@student.classroom).to eq(classroom)
  end

  it 'validating if student plays hooky' do
    expect(@student.play_hooky).to eq('¯(ツ)/¯')
  end
end
