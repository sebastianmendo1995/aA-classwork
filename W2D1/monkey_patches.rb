class String
    def upcase?
        self.upcase == self
    end

end

p "hello".upcase?
p "HELLO".upcase?

class Interger
    def prime?
        return false if self < 2
        (2...self).each do |factor|
            if self % factor  == 0
                return false
            end
        end
        true
    end
end

p 7.prime?

class Array
    def has_zero?
        self.include?(0)
    end
end

p [1,2,3,0,"negrito"].has_zero?