# def my_min(arr)
#     (0...arr.length).each do |i|
#         min = true
#         (0...arr.length).each do |j|
#             next if i == j
#             if arr[j] < arr[i]
#                 min = false
#             end
#         end
#         return arr[i] if min 
#     end
# end

def my_min(arr)
    arr.inject{|acc, el| el < acc ? acc = el : acc }
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)

# def largest_contiguous_subsum(list)
#     collector = []
#     (0...list.length-1).each do |i|
#         (i...list.length).each do |j|
#             collector << list[i..j]
#         end
#     end
#     collector.inject{|acc, el| el.sum > acc.sum ? acc = el : acc}
# end

def largest_contiguous_subsum(list)
    return list.max if list.all?{|ele| ele.negative?}
    greatest = 0
    sum = 0
    list.each do |ele|
        sum += ele
        if sum > greatest
            greatest = sum
        elsif sum < 0
            sum = 0
        end
    end
    greatest
end

list = [2, 7, -6, 3, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])


# def plus_one(num)
#     return num if num == 10
