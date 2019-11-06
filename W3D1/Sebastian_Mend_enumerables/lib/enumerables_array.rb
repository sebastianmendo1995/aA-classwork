# class Array    
#     def my_each(&prc)
#         i = 0
#         while i < self.length
#             prc.call(self[i])
#             i += 1
#         end
#         self
#     end

#     def my_select(&prc)
#         selected = []
#         self.my_each do |ele| 
#             if prc.call(ele)
#                 selected << ele
#             end
#         end
#         selected
#     end

#     def my_reject(&prc)
#         rejected = []
#         self.my_each do |ele| 
#             if !prc.call(ele)
#                 rejected << ele
#             end
#         end
#         rejected
#     end
    
#     def my_any?(&prc)
#         self.my_each{|ele| return true if prc.call(ele) }
#         false
#     end

#     def my_all?(&prc)
#         self.my_each{|ele| return false if !prc.call(ele) }
#         true
#     end

#     def my_flatten
#         answer = []
#         self.my_each do |ele|
#             if ele.class == Array
#                 answer += ele.my_flatten
#             else
#                 answer += [ele]
#             end
#         end
#         return answer
#     end

#     def my_zip(*args)   
#         args = args.unshift(self)
#         answer = Array.new(self.length) { Array.new(args.length, nil) }
#         (0...args.length).each do |col|
#             (0...self.length).each do |row|  
#                 answer[row][col] = args[col][row]
#             end
#         end
#         answer
#     end

#     def my_rotate(n=1)
#         arr = []
#         self.my_each{|el| arr<<el}
#         if n < 0
#             (n*-1).times do
#                 ele = arr.pop
#                 arr.unshift(ele)
#             end
#         else
#             n.times do
#                 ele = arr.shift
#                 arr << ele
#             end
#         end
#         arr
#     end

#     def my_join(char="")
#         new_str = ""
#         (0...self.length).each do |idx|
#             if idx == self.length - 1
#                 new_str += self[idx]
#             else
#                 new_str += self[idx] + char
#             end
#         end
#         new_str
#     end

#     def my_reverse
#         reversed = []
#         (self.length - 1).downto(0) do |i|
#             reversed << self[i]
#         end
#         reversed
#     end

#     def bubble_sort!(&prc)
#         sorted = false
#         while !sorted
#             sorted = true
#             (0...self.length-1).each do |idx|
#                 if prc.call(self[idx], self[idx+1]) == 1
#                     self[idx] , self[idx+1] = self[idx+1], self[idx]
#                     sorted = false 
#                 end
#             end
#         end
#         self
#     end

#     def bubble_sort(&prc)
#         duped_arr = self.dup
#         duped_arr.bubble_sort!(&prc)
#     end

#     def my_inject(&prc)
#         arr.each_with_index do |ele, idx|
            
#     end
# end

# def factors(num)
#     factors = []
#     (1..num).each do |factor|
#         factors << factor if num % factor == 0
#     end
#     factors 
# end

# p factors(10) #[1, 2, 5, 10]
# p "-----------------------"

# def subwords(str, arr)
#     answer = []
#     arr.each do |word|
#         answer << word if str.include?(word)
#     end
#     return answer
# end


# p words = subwords("asdfcatqwer", ["cat", "car"])  #["cat"]
# p words2 = subwords("batcabtarbrat", ["cat", "car"])
# dictionary = ["bears", "ear", "a", "army"]
# p words3 = subwords("erbearsweatmyajs", dictionary)
# p "-----------------------"

# def doubler(arr)
#     arr.map{ |arg| arg*2 }
# end

# array=[1,2,3]
# p doubler(array)
# p "-----------------------"

  x = []
  def foo(x)
    x << "Fancy Feast"
  end
  foo(x)
  p x





