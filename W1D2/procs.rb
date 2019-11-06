# when we see & in the parameters for a method definition we know it will 
# convert a block to a proc and when we see & in the arguments for a method call 
# we know it will convert a proc to a block.

# def add_and_proc(num_1, num_2, prc)
#    sum = num_1 + num_2
#    prc.call(sum)
# end

# doubler = Proc.new { |n| 2*n }
# negate = Proc.new { |n| -1*n }

# p add_and_proc(2,3,doubler)
# p add_and_proc(6,3,negate)

# & parameter will automatically conver a block into a proc object
def add_and_proc(num_1, num_2, &prc)
    sum = num_1 + num_2 
    prc.call(sum)
end

p add_and_proc(2,3) { |n| 2*n }

negate = Proc.new { |n| -1*n }
# & argument will convert the proc into a block
p add_and_proc(6,3,&negate)

# [1,2,3].map { |num| num * 2}

def my_map(arr, &prc)
    new_arr = []
    arr.each { |ele| new_arr << prc.call(ele) }
    new_arr
end

p my_map([1,2,3]){ |num| num * 2}