require_relative "piece"
class Pawn < Piece
  def symbol
    @symbol = :p
  end

  def moves
    forward_steps + side_attacks
  end

  def at_start_row?
    if self.color == :W && self.pos[0] == 1
      return true
    elsif self.color == :B && self.pos[0] == 6
      return true
    end
    false
  end

  def forward_dir
    if self.at_start_row? && self.color == :W
      return [[2, 0], [1, 0]]
    elsif self.at_start_row? && self.color == :B
      return [[-2, 0], [-1, 0]]
    else
      return [1, 0] if self.color == :W
      return [-1, 0] if self.color == :B  
    end
  end

  def forward_steps
    forward = self.forward_dir
    dx, dy = forward
    x, y = self.pos
    posible_steps = []
    unless dx.is_a?(Array)
      posible_steps << [x + dx, y + dy]
    else 
      ddx, ddy = dx
      posible_steps << [x + ddx, y + ddy]
      ddx, ddy = dy
      posible_steps << [x + ddx, y + ddy]
    end
    posible_steps
  end

  def side_attacks
    attack = []
    directions = [[1, 1], [1, -1]] if self.color == :W
    directions = [[-1, 1], [-1, -1]] if self.color == :B  
    directions.each do |dir|
      attack << dir if self.board[dir].color != self.color
    end
    attack
  end
end