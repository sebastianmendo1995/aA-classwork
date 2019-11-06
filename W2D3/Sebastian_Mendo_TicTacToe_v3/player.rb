class Player
    
    attr_accessor :mark

    def initialize(mark_value)
        @mark = mark_value

    end

    def get_position(legal_positions)
        p "Enter a position seperated by a space "
        # p "these are all the legal positions: #{legal_positions}"
        pos = gets.chomp.split(" ")
        pos.map!(&:to_i)
        
        # self.get_position(legal_positions) if !legal_positions.include?(pos)

        if !legal_positions.include?(pos)
            pos = self.get_position(legal_positions) 
        end

        return pos
    end

end

    # def get_position(legal_positions)
    #     legal = false
    #     while !legal
    #         puts "Player #{@mark}, enter two numbers representing a position in the format 'row col'"
    #         pos = gets.chomp.split(" ").map(&:to_i)
    #         if legal_positions.include?(pos)
    #             legal = true
    #         else
    #             puts "Illegal position, try again"
    #         end
    #     end
    #     return pos
    # end