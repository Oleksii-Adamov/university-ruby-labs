# input
input_points = [[150, 49], [221,78], [219,121], [208,158], [167,182], [108,192], [72,171],
                [59,133], [76,115], [91,97], [75,78], [67,58], [79,47], [98,30], [118,22], [136,30], [143,37]]

# calculating the area
sum = 0
for i in 0...input_points.length do
  next_index = i + 1
  if i == input_points.length - 1
    next_index = 0
  end
  puts i
  sum += (input_points[i][0] + input_points[next_index][0]) *
    (input_points[i][1] - input_points[next_index][1])
end
area = sum.abs() .fdiv 2

puts "area = #{area}"