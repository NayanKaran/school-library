require './decorator'

class TrimmerDecorator < Decorator
    def correct_name
      @name.correct_name[0..29]
    end
end