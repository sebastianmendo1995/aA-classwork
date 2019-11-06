def select_even_nums(arr)
    arr.select(&:even?)
end 

def reject_puppies(arr)
    arr.reject{|l| l["age"] <= 2}
end 

def count_positive_subarrays(arr)
    arr.count{|ele| ele.sum > 0}
end 

def aba_translate(word)
    vowels = "aeiou"
    answer = []
    word = word.split("")
    (0...word.length).each do |i|
        if vowels.include?(word[i])
           answer.push(word[i],"b",word[i])
        else   
            answer << word[i]
        end 
    end 
    answer.join("")
end 

def aba_array(arr)
    arr.map{|ele| aba_translate(ele)}
end 