# input
n = 123

# converting to binary
binary = ""
while n > 0 do
  bit = n % 2
  binary = bit.to_s + binary
  n /= 2
end

puts binary