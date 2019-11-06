require_relative "board.rb"
require_relative "card.rb"


class Game
    def initialize(player = nil)
        @board = Board.new
        @player = player
    end

    def play
        while !@board.won?
            @board.render
            puts "Please enter the position of the card you'd like to flip (example: '2,3')"
            pos = gets.chomp.split(",").map!(&:to_i)
            self.make_guess(pos)
        end
    end

    def make_guess(pos)
        
    end
end