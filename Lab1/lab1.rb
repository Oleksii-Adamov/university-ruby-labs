def s(a, b, c, x, phi)
  numerator = Math.sin(3*x)**3 + Math.atan(phi) - 6 * (10 ** 3.1)
  denominator = Math.sqrt(a*x**2 + b*x + c)
  second_addend = Math.exp(x) * Math.tan(x+2).abs

  # check if denominator = 0 (with some precision), if so notify the user, we still can print the result: -Infinity
  if denominator.zero?
    puts "Devision by zero!"
  end

  numerator / denominator + second_addend
end

# obtaining input
print "Please, enter a ="
a = gets.chomp.to_f

print "Please, enter b ="
b = gets.chomp.to_f

print "Please, enter c ="
c = gets.chomp.to_f

print "Please, enter x ="
x = gets.chomp.to_f

print "Please, enter phi ="
phi = gets.chomp.to_f


# calculating the result
result = s(a, b, c, x, phi)


# printing the result
puts "The result is: #{result}"
