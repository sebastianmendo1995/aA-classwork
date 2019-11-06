# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?
        self.max - self.min
    end

    def average
        return nil if self.empty?
        self.sum / (self.length * 1.00)
    end

    def median
        return nil if self.empty?
        if self.length.odd?
            self.sort[(self.length/2.00)]
        else 
            num1 = self.sort[(self.length/2.0)-1]
            num2 = self.sort[(self.length/2.0)]
            (num1+num2)/2.0
        end
    end

    def counts
        hash = Hash.new(0)
        self.each { |el| hash[el] += 1 }
        hash
    end

    def my_count(val)
        count = 0
        self.each { |num| count += 1 if num == val }
        count
    end

    def my_index(val)
        self.each_with_index { |num, i| return i if val == num }
        nil
    end

    def my_uniq
        new_arr = []
        self.each { |ele| new_arr << ele if !new_arr.include?(ele) }
        new_arr
    end

    def my_transpose
        rows = self.length
        cols = self[0].length
        transpose = Array.new(rows) {Array.new(cols)}

        (0...rows).each do |row|
            (0...cols).each do |col|
                transpose[row][col] = self[col][row]
            end
        end
        transpose
    end

end


