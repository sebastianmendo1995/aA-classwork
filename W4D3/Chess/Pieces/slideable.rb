require "byebug"
module Slideable
  HORIZONTAL_DIRS = [[0, 1], [1, 0], [-1, 0], [0, -1]]
  DIAGONAL_DIRS = [[1, 1], [-1, 1], [1, -1], [-1, -1]]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    # horizontal_dirs + diagonal_dirs
    moves = []
    move_dirs.each do |dir|
      dx,dy = dir
      moves += grow_unblocked_moves_in_dir(dx,dy)
    end
    moves
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    possible_moves = []

    x, y = pos
    test_pos = [x+dx,y+dy]

    while board.valid_position?(test_pos) && board.empty?(test_pos)
      possible_moves << test_pos
      test_pos = [ test_pos[0]+dx, test_pos[1]+dy ]
    end
    possible_moves << test_pos if board[test_pos].color != color && board.valid_position?(test_pos)
    possible_moves
  end

  def move_dirs 
    #called within moves
  end

end