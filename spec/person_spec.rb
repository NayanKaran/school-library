require_relative  '../person'
require_relative  '../student'
require_relative  '../teacher'

describe  Person  do
    before ( :all )   do 
      @person = Person.new( 18 , name:  'John' , parent_permission:  true )
    end 
  
    it  'should have an id'   do
      expect(@person.id).not_to be_nil
    end

    it 'should have the correct name'   do
      expect(@person.name).to eq( 'John' )
    end
  
    it  'should have permission'   do 
      expect(@person.parent_permission).to eq( true )
    end 
  end