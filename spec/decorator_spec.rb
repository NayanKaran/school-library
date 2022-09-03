require_relative '../decorators/nameable/decorator'
require_relative '../decorators/nameable/trimmer_decorator'
require_relative '../decorators/nameable/capitalize_decorator'

describe Decorator do
  before :all do
    @person = Person.new(18, name: 'vivekananda', parent_permission: true)
    @capitalized = CapitalizeDecorator.new(@person)
    @trimmed_decorator = TrimmerDecorator.new(@capitalized)
  end

  it 'should be correct_name' do
    expect(@person.correct_name).to eq 'vivekananda'
  end

  it 'should be capitalized correct_name' do
    expect(@capitalized.correct_name).to eq 'Vivekananda'
  end

  it 'should be trimmed correct_name' do
    expect(@trimmed_decorator.correct_name).to eq 'Vivekanand'
    expect(@trimmed_decorator.correct_name.length).to be <= 10
  end
end
