require "byebug"
class Board

  attr_reader :size

  def  initialize(num)
    @grid = Array.new(num) {Array.new(num, :N)}
    @size = num * num
  end

  def [](arr)
    row = arr[0]
    col = arr[1]
    @grid[row][col]
  end

  def []=(pos, val)
    row = pos[0]
    col = pos[1]

    @grid[row][col] = val
  end

  def num_ships
    count = 0
    @grid.each do |sub_arr|
        sub_arr.each {|ele| count += 1 if ele == :S}
    end
    count
  end
  
  def attack(pos)
    if self[pos] == :S
        self[pos]=:H
        p "You sunk my battleship"
        true
    else
        self[pos]=:X
        false
    end
  end



  def place_random_ships
    num_ele = (@grid.length ** 2) * 0.25
    i = 0
    while i < num_ele
        i = 0
        #Generate a random position 
        row = rand(0...@grid.length)
        col = rand(0...@grid.length)
        @grid[row][col] = :S
        @grid.each{|arr| i += arr.count(:S)} 
    end
    @grid
  end
 
  def hidden_ships_grid
    new_arr = Array.new(@grid.length) {Array.new(@grid.length, :N)}
    rows = @grid.length
    cols = @grid.length
    (0...rows).each do |row|
        (0...cols).each do |col|
            @grid[row][col] == :S ? new_arr[row][col] == :N : new_arr[row][col] = @grid[row][col]
        end
    end
    new_arr
  end

  def self.print_grid(matrix)
    matrix.each do |array|
        puts array.join(" ")
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end

end
