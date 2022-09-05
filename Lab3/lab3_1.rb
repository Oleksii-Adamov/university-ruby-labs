# 1)

# input
a = true
b = false
c = true
x = 2
y = 10
z = -50

# computing and printing answers
puts "1)"
puts "  a) #{!(a || b) && (a && !b)}"
puts "  b) #{(z != y).object_id <= (6 >= y).object_id && a || b && c && x >= 1.5}"
puts "  c) #{(8 - x*2 <= z) && (x**2 <= y**2) || (z >= 15)}"
puts "  d) #{x > 0 && y < 0 || z >= (x*y-y/x) + (-z)}"
puts "  e) #{!(a || b && !(c || (!a || b)))}"
puts "  f) #{x**2 + y**2 >= 1 && x >= 0 && y >= 0}"
puts "  g) #{(a && (c && b != b || a) || c) && b}"

# 2)

# input
a = 2.5
p = true

# computing and printing answers
puts "2) #{((Math.log(a) > a) || !p) && (Math.sqrt(a) < a**4)}"