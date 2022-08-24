require './teacher'
require './student'
require './capitalize_decorator'
require './trimmer_decorator'

Student.new(18, '1A', parent_permission: true, name: 'John')
Teacher.new(30, 'Math', parent_permission: true, name: 'Jane')

person = Person.new(22, name: 'sdb nsdb cnsb dncb snbdv nbsd vsndb mvsdnbmv snbd vsdnbmv')
  p person.correct_name
  capitalizedPerson = CapitalizeDecorator.new(person)
  p capitalizedPerson.correct_name
  capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
  p capitalizedTrimmedPerson.correct_name