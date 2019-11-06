#   is_prime?
#     should accept a number as an arg (FAILED - 1)
#     when the number can only be divided by 1 and itself
#       should return true (FAILED - 2)
#     when the number can be divided by numbers other than 1 and itself
#       should return false (FAILED - 3)
#     when the number is less than 2
#       should return false (FAILED - 4)

def is_prime?(num)
    return false if num < 2
    (2...num).each do |ele|
        if num % ele == 0
            return false
        end
    end
    true
end

#   nth_prime
#     should accept a number, n, as an arg (FAILED - 5)
#     should return the nth prime number sequentially (FAILED - 6)


#expect(nth_prime(1)).to eq(2)
    #   expect(nth_prime(2)).to eq(3)
    #   expect(nth_prime(3)).to eq(5)
    
def nth_prime(n) #n=5
    arr = []
    i = 2
    while arr.length != n
        arr << i if is_prime?(i)
        i += 1 
    end

    arr[-1] 
end

#   prime_range
#     should accept two numbers, min and max, as args (FAILED - 7)
#     should return an array of all prime numbers between min and max (FAILED - 8)

def prime_range(min, max) #n=5
    arr = []
    
    while min <= max
        arr << min if is_prime?(min)
        min += 1 
    end
    arr
end