class Dog
    #attr_reader :name, :age
    #attr_writer :name, :age
    attr_accessor :name, :age
    def initialize(name,age, favorite_food)
        @name = name
        @age = age
        @favorite_food = favorite_food
    end

end

my_dog = Dog.new("Negrito", 7, "bones")
p my_dog.name
my_dog.age = 8
p my_dog.age