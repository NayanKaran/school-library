require './book'
require './student'
require './teacher'
require './rental'

class App
  def initialize
    @books = []
    @people = []
  end

  def add_book
    puts
    print 'Title: '
    title = gets.chomp.strip.capitalize
    print 'Author: '
    author = gets.chomp.strip.capitalize
    @books << Book.new(title, author)
  end

  def list_books
    puts
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def create_person
    puts
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    choice = gets.chomp.strip.to_i
    case choice
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_teacher
    puts
    print 'Age: '
    age = gets.chomp.strip.to_i
    while age <= 0 || age >= 100
      print 'Please input a valid age (1 - 100): '
      age = gets.chomp.strip.to_i
    end
    print 'Name: '
    name = gets.chomp.strip.capitalize
    print 'Specialization: '
    specialization = gets.chomp.strip
    @people << Teacher.new(age, specialization, name: name)
    puts 'Teacher created successfully'
  end

  def create_student
    puts
    print 'Age: '
    age = gets.chomp.strip.to_i
    while age <= 0 || age >= 100
      print 'Please input a valid age: (1 - 100): '
      age = gets.chomp.strip.to_i
    end
    print 'Name: '
    name = gets.chomp.strip.capitalize
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.strip.upcase
    case permission
    when 'Y'
      permission = true
    when 'N'
      permission = false
    end
    @people << Student.new(age, nil, parent_permission: permission, name: name)
    puts 'Student created successfully'
  end

  def create_rental # rubocop:disable Metrics/MethodLength
    unless @people.length.positive? && @books.length.positive?
      return puts 'There should be atleast one book and one person. Kindly add atleast one book and one person.'
    end

    puts
    puts 'Select a book from the following list by number'
    list_books
    book_choice = gets.chomp.to_i
    while book_choice.negative? || book_choice >= @books.length
      print "Please enter a number within 0 - #{@books.length - 1} range: "
      book_choice = gets.chomp.to_i
    end
    book = @books[book_choice]
    puts 'Select a person from the following list by number (not id)'
    list_people
    person_choice = gets.chomp.to_i
    while person_choice.negative? || person_choice >= @people.length
      print "Please enter a number within 0 - #{@people.length - 1} range: "
      person_choice = gets.chomp.to_i
    end
    person = @people[person_choice]
    print 'Enter date of booking: (yyyy/mm/dd) : '
    date = gets.chomp.strip
    person.add_rental(date, book)
  end

  def list_people
    puts
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
  end

  def list_rentals
    puts
    print 'ID of person: '
    person_id = gets.chomp
    person = get_person(person_id)
    puts 'Rentals:'
    person.rentals.each do |rental|
      puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.book.author}"
    end
  end

  def get_person(id)
    @people.each do |person|
      return person if person.id == id
    end
  end
end
