require_relative "board.rb"
require_relative "cursor.rb"
require "colorize"


class Display
  attr_accessor :board
  def initialize(board)
    @board = board
    self.render
  end

  def render
    puts "--------------------------------------------".colorize(:background => :green)
    @board.board.each do |subarr|
      puts "#{subarr.map(&:symbol).join("  |  ").colorize(:background => :green)} "
      puts "--------------------------------------------".colorize(:background => :green)
      
    end
  end
end
