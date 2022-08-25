require 'securerandom'
require './interfaces/nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, parent_permission: true, name: 'Unknown')
    super()
    @id = SecureRandom.uuid
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def is_of_age? # rubocop:disable Naming/PredicateName
    @age >= 18
  end
end
