require_relative "./Pieces/piece.rb"
require_relative "./Pieces/nullpiece.rb"
require_relative "./Pieces/pawn.rb"
require_relative "./Pieces/king.rb"
require_relative "./Pieces/rook.rb"
require_relative "./Pieces/knight.rb"
require_relative "./Pieces/bishop.rb"
require_relative "./Pieces/queen.rb"
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
        if row == 1
          board[row][col] = Pawn.new(:W, self, [row,col])
        elsif row == 6
          board[row][col] = Pawn.new(:B, self, [row,col])
        elsif row == 0
          fill_back_row(:W, row, col)
        elsif row == 7
          fill_back_row(:B, row, col)
        else
          board[row][col] = NullPiece.instance
        end
      end
    end
  end

  def fill_back_row(color,row,col)
    arr = [
      Rook.new(color, self, [row, col] ),
      Knight.new(color, self, [row, col] ),
      Bishop.new(color, self, [row, col] ),
      Queen.new(color, self, [row, col] ),
      King.new(color, self, [row, col] ),
      Bishop.new(color, self, [row, col] ),
      Knight.new(color, self, [row, col] ),
      Rook.new(color, self, [row, col] )
    ]
    arr = arr.reverse if color == :B
    board[row][col] = arr[col]
    
  end
  
  def valid_position?(pos)
    row, col = pos 
    if row < 0 || row > 7 || col < 0 || col > 7
      return false
    end
    true
    # pos.all? { |coord| coord.between?(0, 7) }
  end
  
  def move_piece(start_pos, end_pos)
    if valid_position?(start_pos) && valid_position?(end_pos)
      if self[start_pos] == NullPiece.instance
        raise "There is no piece"
      else
        if self[end_pos].color == self[start_pos].color
          raise "Can not take your own piece"
        else 
          piece = self[start_pos]
          if piece.moves.include?(end_pos)
            self[start_pos] =  NullPiece.instance
            self[end_pos] = piece
            piece.pos = end_pos
          else
            raise "Piece cannot be moved there"
          end
        end
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

  def dup
    board.map(&:dup)
  end

  def empty?(pos)
    self[pos].empty?
  end
end



