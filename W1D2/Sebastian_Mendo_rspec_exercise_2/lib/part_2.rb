def palindrome?(str)
    num = str.length - 1
    i = 0
    num.downto(0).each do |o|
        return false if str[i] != str[o]
        i += 1
    end 
    true 
end 

def substrings(str)
    answer = []
    (0...str.length).each do |i|
        if i == str.length-1
            answer << str[i] 
            break
        end
        (1..str.length-i).each do |j|
            answer << str[i,j]
        end 
    end 
    answer 
end 

def palindrome_substrings(str)
    new_arr = substrings(str)
    new_arr.select { |ele| ele.length > 1 && palindrome?(ele) }
end
