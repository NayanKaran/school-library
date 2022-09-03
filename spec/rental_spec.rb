require_relative '../rental'
require_relative '../student'
require_relative '../book'

describe Rental do
  before(:all) do
    @student = Student.new(12, nil, parent_permission: true, name: 'Ram')
    @book = Book.new('The Hobbit', 'J.R.R. Tolkien')
    @rental = Rental.new('2020-10-25', @book, @student)
  end

  it 'should have a date' do
    expect(@rental.date).not_to be_nil
  end

  it 'should have a book' do
    expect(@rental.book).not_to be_nil
  end

  it 'should have a person' do
    expect(@rental.person).not_to be_nil
  end
end
