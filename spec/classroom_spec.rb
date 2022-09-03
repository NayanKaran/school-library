require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before(:all) do
    @classroom = Classroom.new('Maths')
  end

  it 'should return the correct label' do
    expect(@classroom.label).to eq 'Maths'
  end

  describe '#add_student' do
    before(:all) do
      @student = Student.new(12, nil, parent_permission: true, name: 'Ram')
    end
    it 'should add a student to @students' do
      @classroom.add_student(@student)
      expect(@classroom.students.count).to eq 1
    end
  end
end
