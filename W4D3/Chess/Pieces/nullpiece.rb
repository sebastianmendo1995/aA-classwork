require_relative "piece"
require 'singleton'

class NullPiece < Piece
  include Singleton
  
  def moves

  end

  def symbol
    @symbol = " "
  end

  def empty?
    true
  end
end