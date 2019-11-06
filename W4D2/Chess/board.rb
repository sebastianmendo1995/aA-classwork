require_relative "piece.rb"
class PositionError < StandardError
  def message
    puts "This is not a valid position"
  end
end

class Board 
  attr_accessor :board

  def initialize
    @board = Array.new(8){Array.new(8)}
    self.fill_board
  end

  def fill_board
    (0...board.length).each do |row|
      (0...board.length).each do |col|
        if row <= 1
          board[row][col] = Piece.new(:W, board, [row,col])
        elsif row >= 6
          board[row][col] = Piece.new(:B, board, [row,col])
        else
          board[row][col] = nil
        end
      end
    end
  end
  
  def valid_positon?(pos)
    row, col = pos 
    if row < 0 || row > 7 || col < 0 || col > 7
      raise PositionError
    end
    true
  end
  
  def move_piece(start_pos, end_pos)
    if valid_positon?(start_pos) && valid_positon?(end_pos)
      if self[start_pos] == nil #NullPiece.instance
        raise "There is no piece"
      else
        # if board[end_pos].color == color
        #   raise "Can not take your own piece"
        # else 
          piece = self[start_pos]
          self[start_pos] =  nil #NullPiece.instance
          self[end_pos] = piece
        # end
      end
    end
  end

  def [](pos)
    row, col = pos
    board[row][col]
  end

  def[]=(pos,val)
    row, col = pos
    board[row][col] = val
  end

end



