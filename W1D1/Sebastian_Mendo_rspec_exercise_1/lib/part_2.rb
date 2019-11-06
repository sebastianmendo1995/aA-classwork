def hipsterfy(word)
    vowels = ["a", "e", "i", "o", "u"]
    arr = word.split("")
    i = arr.length - 1
    while i>=0
        if vowels.index(arr[i])
            idx = i
            break
            i -= 1
        end
    end

    ans=[]
    (0... arr.length).each do |i|
        if i != idx
            ans.push(arr[i])
        end
    end
    return ans.join("")
end

def vowel_counts(str)
    arr = str.downcase.split("")
    hash = {}
    vowels = ["a", "e", "i", "o", "u"]
    (0... arr.length).each do |i|
        if vowels.index(arr[i]) != nil
            if hash.has_key?(arr[i]) == true
                hash[arr[i]] += 1
            else
                hash[arr[i]] = 1
            end
        end
    end
    hash
end

def caesar_cipher(message, num)
    letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    arr = message.split("")

    (0... arr.length).each do |i|
        if letters.index(arr[i]) != nil
            idx = letters.index(arr[i])
            num.times do
                idx += 1
                if idx >= letters.length
                    idx = 0
                end
            end
            arr[i]= letters[idx]
        end
    end
    message = arr.join("")
    message
end