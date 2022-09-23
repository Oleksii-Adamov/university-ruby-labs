require 'minitest/autorun'
require 'ostruct'

def y(x, n, c)
  (x ** (1 .fdiv 4) - (1 .fdiv x) ** (1 .fdiv 4)) ** (-n) + (x+1).fdiv((x+1)/(x**2 - 4*x + 3*n)) +
    ((36*x*c*n)**(1 .fdiv 4)) .fdiv((x + c*n +1) .fdiv x + 5)
end

def z(x, n, c)
  (Math.tan(2*x) * Math.cos(2*x)**(-1) - Math.tan(2*c + x) * Math.cos(2*x)**(-2)) / (Math.cos(2*x)**(-1) + Math.cos(3*x)**(-2)) +
    (1 + Math.cos(n*x)**(1 .fdiv c)) / (2*x + Math.sin(3*x)**2)
end

def f(x, n, c)
  if x > 2 && x < n
    y(x, n, c)
  elsif x > n && x < 2 * n
    z(x, n, c)
  else
    y(x, n, c) + z(x, n, c)
  end
end

def tabulate_y(n, c)
  arr = Array.new()
  (1.0..n).step((n-1).fdiv(n + c)) do |x|
    point = OpenStruct.new
    point.x = x
    point.val = y(x, n, c)
    arr.append(point)
  end
  arr
end

def tabulate_z(n, c)
  arr = Array.new()
  (Math::PI/n..Math::PI).step((Math::PI - Math::PI/n) / ((3/2)*n + c)) do |x|
    point = OpenStruct.new
    point.x = x
    point.val = z(x, n, c)
    arr.append(point)
  end
  arr
end

def tabulate_f(n, c)
  arr = Array.new()
  (2.0..c).step((c - 2).fdiv(2*n))  do |x|
    point = OpenStruct.new
    point.x = x
    point.val = f(x, n, c)
    arr.append(point)
  end
  arr
end

class UnitTest < MiniTest::Test
  def setup
    @n = 2
    @c = 5
  end
  def test_y
    arr = tabulate_y(@n, @c)
    assert_equal(8, arr.size)
  end
  def test_z
    arr = tabulate_z(@n, @c)
    assert_equal(8, arr.size)
  end
  def test_f
    arr = tabulate_f(@n, @c)
    assert_equal(5, arr.size)
  end
end

# input
n = 2
c = 5
# Припускаємо, що кількість дільниць означає кількість інтервалів між значеннями. Якщо мається на увазі кількість
# значень, потрібно ділити на n+c-1, а не на n+c, у 1) і відповідно в інших -1

# 1)
puts "1)"
y_table = tabulate_y(n, c)
y_table.each do |y|
  puts "  y(#{y.x}) = #{y.val}"
end

# 2)
puts "2)"
z_table = tabulate_z(n, c)
z_table.each do |z|
  puts "  z(#{z.x}) = #{z.val}"
end

# 3)
puts "3)"
f_table = tabulate_f(n, c)
f_table.each do |f|
  puts "  z(#{f.x}) = #{f.val}"
end
