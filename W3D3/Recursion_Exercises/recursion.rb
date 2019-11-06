def range(start, final)
    return [] if final < start
    if (start...final).to_a.length == 1
        return [final-1]
    end

    [start] + range(start+1,final)
    
end

# p range(1,5)
# p range(3,10)

def exp(b,n)
    return 1 if n == 0
    b * exp(b,n-1)
end

# p exp(5,3)
# p exp(10,3)
# p exp(2,256)


def deep_dup(arr)
    return arr.dup if arr.none?{|ele| ele.is_a?(Array)}
    temp = arr[0]
    if temp.is_a?(Array)
        [arr[0].dup] + deep_dup(arr[1..-1])
    else
        [arr[0]] + deep_dup(arr[1..-1])
    end
end

# arr = [1, [2], [3, [4]]]
# results = deep_dup(arr)
# p results

def fib(n)
   return [0,1].take(n) if n <= 2
   prev = fib(n-1)
   prev << prev[-1] + prev[-2]
end

# p fib(0)
# p fib(1)
# p fib(100)
# p fib(20)

def bsearch(arr, target)
    if arr.length == 1 
        if arr[0] == target
            return 0
        else
            return nil
        end
    end
    arr.sort!
    middle = arr.length / 2
    left = arr[0...middle]
    right = arr[middle + 1..-1]
    if arr[middle] == target
        return middle
    elsif arr[middle] < target
        if bsearch(right, target).nil?
            return nil
        # else
            return left.length + 1 + bsearch(right, target)
        end
    else 
        bsearch(left, target)
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


# [1, 2, 3, 4, 5,6, 7], 6

# [1,2,3] 4 [5,6,7]
# middle = 3

# [5] 6 [7]
# middle = 1 

def merge_sort(arr)
    # [6]
    # arr[0] > arr[1]
    # arr[0], arr[1] = arr[1], arr[0]
    return arr if arr.length <= 1
    middle = arr.length / 2
    left = arr[0...middle]
    right = arr[middle..-1]
    a = merge_sort(left) 
    b = merge_sort(right)
    merge(a,b)
end

def merge(left, right)
    return right if left.empty?
    return left if right.empty?
    merge_arr = []
    val_left = left[0]
    val_right = right[0]
    if val_left < val_right
        merge_arr << val_left
        left.shift
       return merge_arr + merge(left,right)
    else
        merge_arr << val_right
        right.shift
        merge_arr + merge(left,right)
    end
end
# test = (1..1000).to_a.shuffle!
# p test
# p merge_sort([6,5,3,1,8,7,2,4])
# p merge_sort(test)

def subsets(arr)
    return [arr] if arr.empty?
    prev = subsets(arr[0..-2]) 
    next_one = []
    prev.each { |sub| next_one << sub + [arr[-1]] }
    return prev + next_one
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]   
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def factorial(n)
    return n if n == 1
    n*factorial(n-1)
end

def permutations(arr)
    sum = []
    return sum << [arr[0]] if arr.length == 1
    #First Way
    (0...arr.length).each do |idx|
    a = arr[idx]
    b = arr[0...idx]+arr[idx+1..-1]
    pre_result = permutations(b).map do |perm|
        perm + [a]
    end
    sum += pre_result
    end
    sum
    #Second Way
    #last = arr.last
    #prev_perm = permutations(arr[0..-2])
    #prev_perm.each do |perm|
    #    arr.length.times do |i|
    #        sum << perm[0...i]+[last]+perm[i..-1]
    #    end
    #end


end
