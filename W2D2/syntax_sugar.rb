class Person
    attr_reader :first_name, :last_name, :age

    def initialize(first_name, last_name, age)
        @first_name = first_name
        @last_name = last_name
        @age = age
    end

    def ==(other_person)
        self.last_name == other_person.last_name
    end    
    
    def >(other_person)
        self.age > other_person.age
    end
end

person_1 = Person.new("Jane", "Doe", 20)
person_2 = Person.new("John", "Doe", 18)

#person_1.==(person_2)
p person_1 == person_2
#person_1.>(person_2)
p person_1 > person_2