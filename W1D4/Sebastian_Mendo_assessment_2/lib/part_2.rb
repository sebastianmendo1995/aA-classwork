def proper_factors(num)
    answer = []
    (1...num).each do |divisor|
        answer << divisor if num % divisor == 0
    end
    answer
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    aliquot_sum(num) == num ?  true : false
end

def ideal_numbers(n)
    count = 0
    answer = []
    (1...Float::INFINITY).each do |num|
        if perfect_number?(num)
            count += 1 
            answer << num
        end
        return answer if count == n
    end
    
end