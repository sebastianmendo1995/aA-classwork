class Player
  def initialize(symbol, display)
    @color = symbol
    @display = display
  end
end

class HumanPlayer < Player
  def make_move(board)
    puts "Enter the position of the piece you want to move Example: 1 7"
    start_pos = gets.chomp.split(" ").map(&:to_i)
    puts "Enter the position where you want  piece you want to move Example: 1 7"
    board.move_piece(start_pos, end_pos)
  end
end

class ComputerPlayer < Player
  def make_move(board)

  end
end