require_relative "player.rb"
require_relative "computer_player.rb"
require_relative "board.rb"
require "byebug"
class Game

    attr_reader :player_1, :player_2

    def initialize(len, *marks)
        @players = []
        marks.each do |mark|
            @players << Player.new(mark)            
        end
        @current_player = @players[0]
        @board = Board.new(len)
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
    end

    def player
        board_empty = @board.empty_positions?
        
        while board_empty
            p "----------------"
            @board.print
            p "----------------"
            puts "Current players turn - #{@current_player.mark}"
            position = @current_player.get_position
            p "----------------"
            
            @board.place_mark(position, @current_player.mark)
            if @board.win?(@current_player.mark)
                @board.print
                return "#{@current_player.mark} - Won!"
                board_empty = "freed"
            end
            switch_turn
            
        end
        p "Cats game"
    end

end

