def average(num1, num2)
    (num1 + num2)/2.0
end

def average_array(arr)
    arr.sum*1.0 / arr.length
end

def repeat(str, num)
    new_str = ""
    num.times { new_str << str }
    new_str
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    arr = str.split(" ")
    arr.map!.with_index do |word, idx|
        if idx.odd?
            word.downcase 
        else
            word.upcase
        end
    end

    arr.join(" ")
end