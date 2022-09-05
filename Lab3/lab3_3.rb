# 1)
# input
x = 2

# computing the result
result = 1
for i in 1..10 do
  #puts (-1)**i
  result += ((-1)**i) * ((i + 1) .fdiv (i + 2)) * x**i
end

puts "1) #{result}"

# 4)
# input
print "n ="
n = gets.chomp.to_i

# computing the result
result = 0
for i in 1..n
  denominator = 0
  for x in 1..i
    denominator += Math.sin(x)
  end
  result += 1 / denominator
end

puts "4) #{result}"