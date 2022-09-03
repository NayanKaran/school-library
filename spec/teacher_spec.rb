require_relative '../teacher'

describe Teacher do
  before :all do
    @teacher = Teacher.new(30, 'Math', name: 'John', parent_permission: true)
  end

  it 'should have an id' do
    expect(@teacher.id).not_to be_nil
  end

  it 'should have the correct name' do
    expect(@teacher.name).to eq('John')
  end

  it 'should have the correct specialization' do
    expect(@teacher.specialization).to eq('Math')
  end
end
