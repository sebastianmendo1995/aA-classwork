module Slideable
  HORIZONTAL_DIRS = [[0,1], [1, 0], [-1, 0], [0, -1]]
  DIAGONAL_DIRS = [[1, 1], [-1, 1], [1, -1], [-1, -1]]

  def horizontal_dirs
    start_pos = @pos 

  end

  def grow_unblocked_move_in_di(dx, dy)
    possible_moves = []
    start_pos = @pos 
    x, y = start_pos
      while @board.valid_position?([x + dx, y + dy]) && @board[[x + dx, y + dy]] == nil #NullPice.instance
        if dx == 0 || dy == 0
          possible_moves << [x + dx, y + dy]
        else 
          possible_moves << [x + dx, y + dy]
        end
        x += dx
        y += dy
      end
  end

  def move_dirs

  end

end