require "byebug"
class Board
    attr_reader :size
  def initialize(num)
    @grid = Array.new(num) {Array.new(num, :N)}
    @size = num * num
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def num_ships
    @grid.flatten.count{|space| space == :S}
  end

  #phase2

  def attack(pos)
    if self[pos] == :S
        self[pos]= :H
        puts "You sunk my battleship!!"
        return true
    else
        self[pos]=:X
        return false
    end
  end

  def place_random_ships
    quarter = (@size * 0.25).to_i
    len = Math.sqrt(@size)
    filled = false
    while !filled
        row = rand(0...len)
        col = rand(0...len)
        self[[row,col]]=:S
        filled = true if self.num_ships == quarter
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
        row.map do |space|
            space == :S ? :N : space
        end
    end
  end

  def self.print_grid(grid)
    grid.each {|ele| puts ele.join(" ")}
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end

end
