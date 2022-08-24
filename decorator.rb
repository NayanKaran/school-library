require './nameable'

class Decorator < Nameable
    attr_accessor :name
    def initialize(name)
      @name = name
    end
    def correct_name
      @name.correct_name
    end
end