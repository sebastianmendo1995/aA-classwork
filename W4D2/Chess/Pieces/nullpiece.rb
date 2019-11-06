require 'singleton'

class NullPiece < Piece
  include Singleton
  def initialize
    super("Neutral", @board, @pos)
  end

  def moves

  end

  def symbol
    
  end
end