require './teacher'
require './student'
require './decorators/nameable/capitalize_decorator'
require './decorators/nameable/trimmer_decorator'

Student.new(18, '1A', parent_permission: true, name: 'John')
Teacher.new(30, 'Math', parent_permission: true, name: 'Jane')

person = Person.new(22, name: 'sdb nsdb cnsb dncb snbdv nbsd vsndb mvsdnbmv snbd vsdnbmv')
p person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
p capitalized_trimmed_person.correct_name
