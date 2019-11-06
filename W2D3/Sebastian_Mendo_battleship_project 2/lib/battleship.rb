require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player
    
    def initialize(length)
        @player = Player.new
        @board = Board.new(length)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        print @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            print 'You lose'
            true
        else
            false
        end
    end

    def win?
        if @board.num_ships == 0
            print 'You win'
            true
        else
            false
        end
    end

    def game_over?
        win? || lose? ? true: false
    end

    def turn
        move = @player.get_move
        if @board.attack(move)
            @board.print
            p @remaining_misses
        else
            @board.print
            p @remaining_misses -= 1

        end

    end
end
