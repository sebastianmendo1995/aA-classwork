def sum_to(n)
    return 1 if n == 1
    return nil if n < 0
    n + sum_to(n-1)
end

p  sum_to(5)  # => returns 15
p  sum_to(1)  # => returns 1
p  sum_to(9)  # => returns 45
p  sum_to(-8)  # => returns n

p '----------------------------'

def add_numbers(nums_array)
    return nums_array.first if nums_array.length <= 1
    nums_array.first + add_numbers(nums_array[1..-1])
end

p  add_numbers([1,2,3,4]) # => returns 10
p  add_numbers([3]) # => returns 3
p  add_numbers([-80,34,7]) # => returns -39
p  add_numbers([]) # => returns nil

p '----------------------------'

def gamma_fnc(n)
    return nil if n <= 0
    return 1 if n == 1
    
    (n-1)*gamma_fnc(n-1)
end
p  gamma_fnc(0)  # => returns nil
p  gamma_fnc(1)  # => returns 1
p  gamma_fnc(4)  # => returns 6
p  gamma_fnc(8)  # => returns 5040

p '----------------------------'

def ice_cream_shop(flavours, favorite)
    return false if flavours.empty?
    return true if flavours[0] == favorite
    flavours.shift
    ice_cream_shop(flavours, favorite)
end

p  ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
p  ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
p  ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
p  ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
p  ice_cream_shop([], 'honey lavender')  # => returns false

p '----------------------------'

def reverse(str)
    return str if str.length <= 1
    reverse(str[1..-1]) + str[0]
end

p  reverse("house") # => "esuoh"
p  reverse("dog") # => "god"
p  reverse("atom") # => "mota"
p  reverse("q") # => "q"
p  reverse("id") # => "di"
p  reverse("") # => ""
p '----------------------------'