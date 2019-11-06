class Dog
    def initialize(name)
        @name = name
    end

    def self.bark
        "WOOOOF!!!!"
    end

    def self.compare_dogs(dog_1, dog_2)
        if dog_1.name.length > dog_2.name.length
            return dog_1.name
        else
            return dog_2.name
        end
    end

    def yell_name
        @name.upcase + "!"
    end

    def name
        @name
    end

end

#Dog::bark is a class method
#Dog#yell_name is a instance method

p Dog.bark

d1 = Dog.new("Negrito")
d2 = Dog.new("Snopy")

p Dog.compare_dogs(d1, d2)
