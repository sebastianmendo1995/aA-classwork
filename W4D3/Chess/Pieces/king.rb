require_relative "piece"
require_relative "stepable"
class King < Piece
  include Stepable

  def symbol
    @symbol = :K
  end
  DIRECTIONS = [
    [1, 1],
    [1, 0],
    [1, -1],
    [0, 1],
    [0, -1],
    [-1, 1],
    [-1, 0],
    [-1, -1]
  ]
end