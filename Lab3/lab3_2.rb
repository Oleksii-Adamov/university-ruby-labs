# input
print "x ="
x = gets.chomp.to_f

# if
y = if x > -4 && x <= 0
      (((x - 2).abs) / (x**2 * Math.cos(x))) ** (1 .fdiv 7)
    elsif x > 0 && x <= 12
      1 / (Math.tan(x + 1/Math.exp(x)) / Math.sin(x)**2) ** (2 .fdiv 7)
    elsif x < -4 || x > 12
      1 / (1 + x / (1 + x / (1 + x)))
    end

puts "y = #{y}"
# case

y = case x
    when (-4.0).next_float..0
      (((x - 2).abs) / (x**2 * Math.cos(x))) ** (1 .fdiv 7)
    when (0.0).next_float..12
      1 / (Math.tan(x + 1/Math.exp(x)) / Math.sin(x)**2) ** (2 .fdiv 7)
    when -Float::INFINITY...-4
      1 / (1 + x / (1 + x / (1 + x)))
    when (12..)
      1 / (1 + x / (1 + x / (1 + x)))
    end

puts "y = #{y}"