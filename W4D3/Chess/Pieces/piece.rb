class Piece
  attr_accessor :color, :board, :pos
  def initialize(color = "", board = "", pos = "")
    @color = color
    @board = board
    @pos = pos
  end

  def empty?
    false
  end

  def valid_moves
    self.moves
  end

  def to_s
    self.symbol #.colorize(self.color)
  end

  def symbol

  end

  def move_into_check?(end_pos)
    
  end
end