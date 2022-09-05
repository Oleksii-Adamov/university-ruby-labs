# input
p = 2
r = 8
t = 16

# calculating the range
max_value = ((p ** r) * (1 - p ** (-t))).to_f

puts max_value

