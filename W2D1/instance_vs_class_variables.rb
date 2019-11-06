
class Car

    @@num_wheels = 4

    def initialize(marca, modelo, color)
        @marca = marca
        @modelo = modelo
        @color = color
    end

    def num_wheels 
        @@num_wheels
    end

    def self_upgrade
        @@num_wheels = 0
    end

end

car_1 = Car.new("Honda", "Civic", "Plomo")

p car_1.num_wheels

car_1.self_upgrade

p car_1.num_wheels

word = "bootcamp"
subword = word[1..4]
p subword

arr = [1,2,3]

arr.each {|x| puts x}

location = {"city" => "SF"}

p location["city"]