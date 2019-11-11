require "set"

def bad_two_sum?(arr,target)
    (arr.length-1).times do |i|
        (i+1...arr.length).each do |j|
            return true if arr[i] + arr[j] == target
        end
    end
    false
end

arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr,target)
    arr = arr.sort
    arr.each_with_index do |ele,idx|
        num = arr.delete_at(idx)
        return true if !arr.bsearch{|x| x==target-ele}.nil?
        arr.unshift(num)
    end
    false
end
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

require "byebug"
def two_sum?(arr, target)
    aset = Set.new
    arr.each do |ele|
        # debugger
        lookup = target - ele
        if aset.include?(lookup)
            return true
        else
            aset << ele
        end
    end
    false
end

p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false