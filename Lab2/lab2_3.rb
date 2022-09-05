# input
binary = "1000010001"

# converting to decimal
base = 1
decimal = 0
for i in (binary.length-1).downto(0) do
  puts binary[i]
  puts binary[i].to_i
  decimal += binary[i].to_i * base
  base *= 2
end

puts decimal