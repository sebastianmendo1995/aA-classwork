def zip (*arrays)
    rows = arrays[0].length
    cols = arrays.length

    ans = Array.new(rows) {Array.new(cols)}

    (0...rows).each do |i|
        (0...cols).each do |j|
            ans[i][j] = arrays[j][i]
        end
    end
    ans
end

def prizz_proc(arr, prc1, prc2)
    ans = []
    arr.each{ |ele| ans << ele if prc1.call(ele) != prc2.call(ele) }
    ans
end

def zany_zip(*arrays)
    rows = arrays.map{|ele| ele.length}.max
    cols = arrays.length
    ans = Array.new(rows) {Array.new(cols, nil)}
    (0...rows).each do |i|
        (0...cols).each do |j|
            ans[i][j] = arrays[j][i]
        end
    end
    ans
end

def maximum(arr, &prc)
    arr.inject { |max, ele| prc.call(ele) >= prc.call(max) ? ele : max}
end

def my_group_by(arr, &prc)
    ans = Hash.new { |key, val| key[val] = []}
    arr.each {|ele| ans[prc.call(ele)] << ele}
    ans
end

def max_tie_breaker(arr, prc1, &prc2)
    arr.inject do |max, ele|
        if prc2.call(ele) > prc2.call(max) 
            ele
        elsif prc2.call(ele) == prc2.call(max) && prc1.call(ele) > prc1.call(max)
            ele
        else
            max
        end
    end
end

def silly_syllables(sentences)
    words = sentences.split(" ")
    vowels = "aeiou"
    ans = []
    words.each do |word|
        if word.count(vowels) > 1
            temp = ""
            first = word.index(/([aeiou].*)/)
            last = word.length-1 - word.reverse.index(/([aeiou].*)/)
            temp += word[first..last]
            ans << temp
        else
            ans << word
        end
    end
    ans.join(" ")
end
