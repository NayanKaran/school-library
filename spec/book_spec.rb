require_relative '../book'
require_relative '../person'

describe Book do
  before(:all) do
    @book = Book.new('The Hobbit', 'J.R.R. Tolkien')
  end

  it 'should return the correct title' do
    expect(@book.title).to eq 'The Hobbit'
  end

  it 'should return the correct author' do
    expect(@book.title).to eq 'The Hobbit'
  end

  describe '#add_rental' do
    before(:all) do
      @person = Person.new(18, name: 'John', parent_permission: true)
    end
    it 'should add a rental to @rentals' do
      @book.add_rental('2020-01-01', @person)
      expect(@book.rentals.count).to eq 1
    end
  end
end
