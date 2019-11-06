class Player
    
    attr_accessor :mark

    def initialize(mark_value)
        @mark = mark_value

    end

    def get_position
        p "Enter a position seperated by a space "
        p "example: 2 3"
        pos = gets.chomp.split(" ")
        letters = pos.any?{ |ele| ("a".."z").to_a.include?(ele)}
        pos.map!(&:to_i)
        if !(pos.length == 2 && !letters)
            raise "try answer again with correct formatting"
        end
        pos
    end



end
