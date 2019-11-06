def no_dupes?(arr)
    ans = []
    (0...arr.length).each do |i|
        temp = arr[0...i] + arr[i+1..-1]
        if !temp.include?(arr[i])
            ans << arr[i]
        end
    end
    ans
end

p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []
 
p '------------------------------------'


def no_consecutive_repeats?(arr)
    (0...arr.length-1).each { |idx| return false if arr[idx] == arr[idx+1] }
    true
end

p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true

p '------------------------------------'

def char_indices(str)
    hash = Hash.new {|k,v| k[v]= []}
    str.split("").each_with_index do |char, idx|
        hash[char] << idx
    end
    hash
end

p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

p '------------------------------------'

def longest_streak(str)
    letter = ""
    (0...str.length).each do |i|
        count = 1
        (i+1...str.length).each do |j|
            if str[i] == str[j]
                count += 1
            else
                break
            end
        end
        if count >= letter.length
            letter=""
            count.times do 
                letter += str[i]
            end
        end
    end
    letter
end

p longest_streak('a')           # => 'a'
p longest_streak('accccbbbbaaa')# => 'bbbb'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'

p '------------------------------------'

def bi_prime?(num)
    return false if num < 2
    primes = get_primes(num)
    primes.each do |prime1|
        primes.each do |prime2|
            return true if prime1*prime2 == num
        end
    end
    false
end

def get_primes(num)
    arr = []
    (2...num).each do |n|
        arr << n if is_prime?(n)
    end
    arr
end

def is_prime?(num)
    return false if num < 2
    (2...num).each do |factor|
        return false if num % factor == 0
    end
    true
end

p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false

p '------------------------------------'

def vigenere_cipher(str,keys)
    alpha = ('a'..'z').to_a
    start = 0
    (0...str.length).each do |i|
        index = alpha.index(str[i]) + keys[start%keys.length]
        str[i] = alpha[index % 26]
        start += 1
    end
    str
end

p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

p '------------------------------------'

def vowel_rotate(str)
    vowels = "aeiou"
    arr_vowels = []
    str.each_char {|char| arr_vowels << char if vowels.include?(char)}
    last = arr_vowels.pop
    arr_vowels.unshift(last)
    replace = 0
    str.each_char.with_index do |char, idx|
        if vowels.include?(char)
            str[idx] = arr_vowels[replace]
            replace += 1
        end
    end

end

p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"

p '------------------------------------'

class String
    def select(&prc)
        prc ||= Proc.new{}
        str = ""
        self.each_char {|char| str += char if prc.call(char)}
        str
    end

    def map!(&prc)
        self.each_char.with_index do |char, idx|
            self[idx] = prc.call(char)
        end
    end
end

p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""

p '------------------------------------'

word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

p '------------------------------------'

#Recursion Problemsdef multiply(a, b)

def multiply(a, b)
    return a if b == 1
    return a if b == -1
    sum = 0
    b > 0 ? b-=1 : b+= 1
    sum += a + multiply(a,b)
end

p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18

p '------------------------------------'

def lucas_sequence(num)
    
    return [] if num == 0
    return [2] if num == 1
    return [2,1] if num == 2
    lucas_sequence(num-1) << lucas_sequence(num-1)[-1] + lucas_sequence(num-2)[-1]
    
end


p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

p '------------------------------------'

def prime_factorization(num)
    return [num] if is_prime?(num)
    ans = []
    (0...num).each do |i|
        if is_prime?(i) && num % i == 0
            ans << i
            num = num / i
            break
        end
    end
    ans += prime_factorization(num).flatten
    ans
end

def is_prime?(num)
    return false if num < 2
    (2...num).each {|factor| return false if num%factor==0}
    true
end
p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]
p prime_factorization(288)