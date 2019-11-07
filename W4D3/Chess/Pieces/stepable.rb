module Stepable
  def moves
    return move_diffs
  end

  def move_diffs
    moves = []

    DIRECTIONS.each do |dir|
      x, y = self.pos 
      dx, dy = dir
      if board.valid_position?([x+dx, y+dy]) && self.board[[x+dx, y+dy]].color != self.color
        moves << [x+dx, y+dy]
      end
    end
    moves 
  end
end