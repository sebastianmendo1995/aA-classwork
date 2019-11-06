# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
   num.downto(2).each do |i|
      if is_prime?(i) && num % i == 0
        return i   
      end 
   end 
end 

def is_prime?(num)
    return false if num < 2
    (2...num).each do |i|
        if num % i == 0
            return false 
        end 
    end 
    return true 
end

def unique_chars?(str)
    str.each_char do |char|
        return false if str.count(char.downcase) > 1
    end
    true
end

def dupe_indices(arr)
    indices = Hash.new { |h, k| h[k] = [] }
    arr.each_with_index { |ele, idx| indices[ele] << idx }
    indices.select { |key, value| value.length > 1}
end

def ana_array(arr1, arr2)

    hash1 = Hash.new(0)
    hash2 = Hash.new(0)

    arr1.each { |ele| hash1[ele] += 1}
    arr2.each { |ele| hash2[ele] += 1}

    hash1 == hash2
end