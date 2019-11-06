def my_reject(arr, &prc)
    new_arr = []
    arr.each {|num| new_arr << num if !prc.call(num)}
    new_arr
end

def my_one?(arr, &prc)
    count = 0
    arr.each { |ele| count += 1 if prc.call(ele)  }
    count == 1 ? true : false
end

def hash_select(hash, &prc)
    answer = Hash.new(0)
    hash.each { |key, value| answer[key] += value if prc.call(key, value) }
    answer
end

def xor_select(arr, prc1, prc2)
    answer = []
    arr.each do |ele|
        if prc1.call(ele)
            if !prc2.call(ele)
                answer << ele  
            end
        elsif prc2.call(ele)
            if !prc1.call(ele)
                answer << ele
            end
        end
    end
            
    answer
end

def proc_count(val, arr)
    counter = 0
    arr.each { |prc| counter +=1 if prc.call(val)}
    counter
end