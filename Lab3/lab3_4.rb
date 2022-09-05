def fact (n)
  result = 1
  for i in 2..n
    result *= i
  end
  result
end

eps = 0.00001

# 1)
result = 0
for n in (2..)
  addend = (fact(n - 1) .fdiv fact(n + 1)) ** (n * (n + 1))
  break if addend < eps
  result += addend
end
puts "1) #{result}"

# 2)
# input
print "x ="
x = gets.chomp.to_i
result = 0
eps_for_ln = eps / 2
for n in (0..)
  addend = ((x - 1)**(2*n + 1)) .fdiv (2*n + 1) * (x + 1)**(2*n + 1)
  break if addend < eps_for_ln
  result += addend
end
result *= 2
puts "2)"
puts "  Infinite sum ln(#{x}) = #{result}"
puts "  Math.log(#{x}) = #{Math.log(x)}"
puts "  abs diff = #{(result - Math.log(x)).abs}"
puts "  abs diff < eps = #{(result - Math.log(x)).abs < eps}"

# 3)
result = 0
for n in (1..)
  addend = (fact(4*n - 1) * fact(2*n - 1)) .fdiv fact(4*n) * 2**(2*n) * fact(2*n)
  break if addend < eps
  result += addend
end
puts "3) #{result}"