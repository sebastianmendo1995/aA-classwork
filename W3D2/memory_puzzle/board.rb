require_relative "card.rb"
class Board
    LETTERS = ('a'..'z').to_a
    attr_reader :size, :grid
    
    def initialize(num = 4)
        @grid = Array.new(num) {Array.new(num)}
        @size = num * num
        self.populate
    end

    def populate
        cards = []
        LETTERS.shuffle!.each do |ele|
            if cards.length < @size
                2.times {cards << Card.new(ele)}
            end
        end

        cards.shuffle!
        (0...@grid.length).each do |row|
            (0...@grid.length).each do |col|
                card = cards.pop
                @grid[row][col] = card
            end
        end
        @grid
    end

    def render
        p " 0 1 2 3"
        @grid.each_with_index do |arr, idx|
            puts "#{idx} #{arr.join(" ")}"
        end
    end

    def won?
        @grid.all? do |arr|
            arr.all? do |ele|
                ele.reveal?
            end
        end
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def reveal(pos)
        self[pos].reveal_card
        self[pos].value
    end
    
end