sym = :hello
str = "hello"

#symbols are immutable -- cannot change
#strings are mutable -- can change

str[0] = "x"

p sym
p str

bootcamp_1 = {:name=>"app academy", :color=>"red"}
bootcamp_2 = {name:"map academy", color:"blue"}

p bootcamp_1[:name]
#Always reference with the colon at the beginning
p bootcamp_2[:name]

def say_hello(first_name, *others_args)
    p first_name
    p others_args
end

p say_hello("Sebastian", "Mauricio", "Michelle")

arr = ["a", "z"]

arr2 = [*arr, "b", "c"]

p say_hello(*arr2)


#Remember the next 'acc' will be the result of the block on every iteration 
arr = [2, 3, 1, 7]
result = arr.inject do |acc, el|
    if el < acc
        el
    else #this is necesary to avoid the loop from resulting in nil
        acc
    end
end

p result

arr2 = [11, 7, 2, 4]

r = arr2.inject(0) do |acc, el|
    if el.even?
        acc + el
    else
        acc
    end
end

p r