# require_relative player.rb


class Board
    
    def initialize(n)
        @board = Array.new(n) { Array.new(n, "_")}
    end

    def valid?(position) 
        row = position[0]
        col = position[1]
        return false if (row < 0 || row > @board.length-1) || (col < 0 || col > @board.length-1)
        true
    end

    def [](position)
        row = position[0]
        col = position[1]
        @board[row][col]
    end

    def []=(pos, val)
        row = pos[0]
        col = pos[1]
        @board[row][col]=val
    end

    def empty?(position)
        return true if self[position] == "_"
        false
    end

    def place_mark(position, mark)
        if valid?(position) && empty?(position)
            self[position]=mark
        elsif !valid?(position)
            raise "Not valid position" 
        else 
            raise "Position taken"
        end
    end

    def print
        @board.each do |arr|
            p arr.join(" ")
        end
    end

    def win_row?(mark)
        if @board.any?{|arr| arr.all?(mark) }
            return true
        else
            false
        end
    end

    def win_col?(mark)
        temp = @board.transpose
        if temp.any?{|arr| arr.all?(mark)}
            return true
        else
            false
        end
    end
    
    def win_diagonal?(mark)
        reverse = @board.map(&:reverse)
        first_take = (0...@board.length).collect { |i| @board[i][i]}
        second_take = (0...@board.length).collect { |i| reverse[i][i]}
        return true if first_take.uniq.length == 1 && first_take.first == mark
        return true if second_take.uniq.length == 1 && second_take.first == mark
        false
    end

    def win?(mark)
        win_col?(mark) || win_row?(mark) || win_diagonal?(mark)
    end

    # return true if win_col?(mark) || win_row?(mark)|| win_diagonal?(mark)
    #     false

    def empty_positions?
        @board.any? { |arr| arr.include?("_")}
    end


end


