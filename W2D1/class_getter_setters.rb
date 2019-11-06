class Cat
    def initialize(name, color, age)
        @name = name
        @color = color
        @age = age
    end

    def getter_age
        @age
    end
    
    def getter_color
        @color
    end
    
    def getter_name
        @name
    end

    def setter_age=(number)
        @age = number
    end

    def setter_name=(new_name)
        @name = new_name
    end
    
    def setter_color=(new_color)
        @color = new_color
    end

    #other functions

    def meow_at(person)
        p "#{@name} meows at #{person}"
    end
end

cat_1 = Cat.new("negrito", "black", 7)
cat_1.setter_age = 8

cat_1.meow_at("Sebastian")