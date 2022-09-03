require_relative '../student'

describe Student do
  before(:all) do
    @student = Student.new(12, nil, parent_permission: true, name: 'Ram')
  end

  it 'should return the correct name' do
    expect(@student.name).to eq 'Ram'
  end

  it 'should return the correct age' do
    expect(@student.age).to eq 12
  end

  it 'should return the correct parent permission' do
    expect(@student.parent_permission).to eq true
  end

  describe '#play_hooky' do
    it 'should return the correct string' do
      expect(@student.play_hooky).to eq "¯\(ツ)/¯"
    end
  end
end
