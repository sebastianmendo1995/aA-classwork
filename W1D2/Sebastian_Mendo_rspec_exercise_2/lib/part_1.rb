def partition(arr, num)
    arr1 = []
    arr2 = []

    arr.each do |ele|
        if ele < num
            arr1 << ele 
        else
            arr2 << ele
        end
    end

    [arr1,arr2]

end

def merge(hash1, hash2)
    hash1.merge(hash2)
end

def censor(sentence, arr)
    sentence_arr = sentence.split(" ")
    sentence_arr.each_with_index {|word, idx| sentence_arr[idx] = replace_vowel(word) if arr.include?(word.downcase)}
    sentence_arr.join(" ")
end

def replace_vowel(word)
    vowels = "aeiou"
    word.each_char.with_index { |char, idx| word[idx] = "*" if vowels.include?(char.downcase) }
    word 
end

def power_of_two?(num)
    i = 0
    while i <= num
      return true if  2 ** i == num
      i += 1
    end 
    false 
end 

