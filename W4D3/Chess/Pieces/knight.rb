require_relative "piece"


require_relative "stepable"
require_relative "piece"
class Knight < Piece
  include Stepable
  def symbol
    @symbol = :k
  end
  DIRECTIONS = [
    [-1, -2],
    [-2, -1],
    [1, -2],
    [2, -1],
    [2, 1],
    [1, 2],
    [-1, 2],
    [-2, 1]
  ]
end