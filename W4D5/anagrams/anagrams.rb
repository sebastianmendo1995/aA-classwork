def first_anagram?(str1, str2)
    arr1 = str1.split("")
    perm = arr1.permutation.to_a
    perm.include?(str2.split(""))
end

def second_anagram?(str1, str2)
    arr1 = str1.split("")
    arr2 = str2.split("")

    arr1.each do |letter|
        idx = arr2.index(letter)
        return false if idx.nil?
        arr2.delete_at(idx)
    end
    arr2.empty?
end

def third_anagram?(str1, str2)
    str1.split("").sort == str2.split("").sort
end

def fourth_anagram?(str1, str2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)
    str1.each { |ele| hash1[ele] += 1 }
    str2.each { |ele| hash2[ele] += 1 }
    hash1 == hash2
end

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true

