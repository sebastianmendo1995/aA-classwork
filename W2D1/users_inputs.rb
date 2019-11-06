puts "Enter your name:"

name = gets.chomp

p "Hello " + name

p "Enter your age:"

num = gets.chomp.to_i
num *= 2
p "You r " + num.to_s + " years old."