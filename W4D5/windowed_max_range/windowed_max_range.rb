def windowed_max_range(arr, num)
    current_max_range = 0
    (0..arr.length-num).each do |i|
        window = arr[i...i+num]
        if window.max - window.min > current_max_range
            current_max_range = window.max - window.min
        end
    end
    current_max_range
end
#[1,3,2,5] 3 --- > 3

# this will be O(n^2)


p windowed_max_range([1, 0, 2, 5, 4, 8], 2) # == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) # == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) # == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) # == 6 # 3, 2, 5, 4, 8

class MyQueue
    def initialize
        @my_queue = []
    end

    def dequeue
        @my_queue.shift
    end

    def queue(ele)
        @my_queue << ele
    end

    def peek
        @my_queue[0]
    end

    def size
        @my_queue.length
    end

    def empty?
        @my_queue.empty?
    end
end


class MyStack
    def initialize
        @my_stack = []
    end

    def my_push(ele)
        @my_stack << ele
    end

    def my_pop
        @my_stack.pop
    end

    def peek
        @my_stack[-1]
    end

    def size
        @my_stack.length
    end

    def empty?
        @my_stack.empty?
    end
end

class StackQueue
    def initialize
        @front = MyStack.new
    end

    def stackqueue_dequeue
        @front.my_stack = @front.my_stack.reverse.my_pop

    end





end