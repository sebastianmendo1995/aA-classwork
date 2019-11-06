def strange_sums(arr)
    count = 0
    arr.each_with_index do |ele, idx|
        (idx+1...arr.length).each do |j|
            if ele + arr[j] == 0
                count += 1
            end
        end
    end
    count
end

def pair_product(arr, product)
    arr.each_with_index do |ele, idx|
        (idx+1...arr.length).each do |j|
            if ele * arr[j] == product
                return true
            end
        end
    end
    false
end

def rampant_repeats(str, hash)
    answer = ""
    str.each_char do |char|
        if !hash[char].nil?
            hash[char].times do |ele|
                answer << char 
            end
        else
            answer << char  
        end
    end
    answer
end

def perfect_square(num)
    (1..num).each do |ele|
        if ele * ele == num
            return true
        end
    end
    return false

end

def anti_prime?(num)
    num_divisor = find_divisor(num)
    (num-1).downto(1) do |i|
        divisor = find_divisor(i)
        if num_divisor < divisor
            return false
        end
    end
    true
end

def find_divisor(num)
    count = 0
    (1..num).each do |n|
        if num % n == 0
            count += 1
        end
    end
    count
end

def matrix_addition(matrix1, matrix2)
    answer = Array.new(matrix1.length) {Array.new(2,0)}
    (0...matrix1.length).each do |i|
        (0...matrix1[i].length).each do |j|
            answer[i][j] = matrix1[i][j] + matrix2[i][j]
        end
    end
    answer
end

def mutual_factors(*array)
    min_number = array.min
    answer = []
    (1..min_number).each do |i|
        common_divisor = true
        j = 0
        while common_divisor == true && j < array.length
            common_divisor = false if array[j] % i != 0
            j += 1
        end
        answer << i if common_divisor == true
    end
    answer
end

def tribonacci_number(n) 
    memo = [1,1,2]
    return memo[n-1] if n <= 3 
    tribonacci_number(n-1) + tribonacci_number(n-2) + tribonacci_number(n-3)    
end

def matrix_addition_reloaded(*matrix)
    dimension_equals = matrix[0].length
    matrix.each do |m|
        return nil if m.length != dimension_equals
    end
    matrix.inject {|accum,ele| matrix_addition(accum,ele)} 
end

def squarocol?(matrix)
    matrix.each_with_index do |arr, idx|
        return true if arr.all?(arr[0])
    end  
    
    temp=[]
    (0...matrix.length).each do |ele|
        (0...matrix.length).each do |ele2|
            temp.push(matrix[ele2][ele])
        end
        return true if temp.all?(temp[0])
        temp=[]
    end
    false

end

def squaragonal?(matrix)
    i=0
    j = matrix.length-1
    d1=[]
    d2 =[]
    while i < matrix.length
        d1.push(matrix[i][i])
        i+=1
    end
    return true if d1.all?(d1[0])
    i=0
    j.downto(0) do |k|
        d2 << matrix[i][k] 
        i += 1
    end
    return true if d2.all?(d2[0])
    false
end

def pascals_triangle(n)
    arr = []
    i = 1
    while i <= n
        arr1 = Array.new(i, 1)
        if i > 2
            arr[i-2].each_with_index do |ele,idx|
                if idx <= arr[i-2].length-2
                    arr1[idx+1] = arr[i-2][idx] + arr[i-2][idx+1]
                end    
            end
        end
        arr << arr1
        i += 1 
    end
    arr
end

def mersenne_prime(n)
    array_prime = []
    i = 0
    while array_prime.length != n
        candidate = 2**i-1
        array_prime << candidate if is_prime?(candidate)
        i += 1 
    end
    array_prime[-1]

end

def is_prime?(num)
    return false if num < 2
    (2...num).each do |ele|
        return false if num % ele == 0
    end
    true
end

def triangular_word?(word)
    arr = [*('a'..'z')]
    triangular = [1]
    hash = {}
    arr.each_with_index do |char,idx|
        hash[char] = idx+1
    end
    
    sum = 0
    word.each_char do|char|
        sum += hash[char] 
    end
    n = 2
    while triangular[-1] < sum
        triangular << (n*(n+1))/2
        n+=1
    end
    triangular[-1] == sum ? true : false
end

def consecutive_collapse(array)
    done = false
    while !done
        done = true
        (0...array.length - 1).each do |i|
            if array[i] == array[i+1]+1 || array[i] == array[i+1]-1
                array.delete_at(i+1)
                array.delete_at(i)
                done=false
                break
            end
        end
    end
    array
end

def pretentious_primes(array, n) 
    if n > 0
        (0...array.length).each do |i|
            primes = []
            j = array[i] + 1
            while primes.length != n 
                if is_prime?(j)
                    primes << j
                end
                j += 1
            end
            array[i] = primes[-1]
        end
    else 
        (0...array.length).each do |i|
            primes = []
            num = array[i] - 1
            num.downto(1) do |j|
                if is_prime?(j)
                    primes << j
                end
                if j == 1
                    primes << nil
                    break
                end
                if primes.length == n*-1
                    break
                end
            end
            array[i] = primes[-1]
        end
    end
    array
end
