require 'minitest/autorun'
require 'ostruct'

def f(x, a, b, c)
  res = 0.0
  if x < 0 && !b.zero?
    res = a * x**2 + b
  elsif x > 0 && b.zero?
    res = (x - a).fdiv(x - c)
  else
    res = x .fdiv c
  end
  if ((Integer(a) | Integer(b)) & (Integer(a) | Integer(c))).zero?
    unless res.infinite? || res.nan?
      res = Integer(res)
    end
  end
  res
end

def tabulate_f(a, b, c, x_beg, x_end, dx)
  arr = Array.new()
  (x_beg..x_end).step(dx) do |x|
    point = OpenStruct.new
    point.x = x
    point.val = f(x, a, b, c)
    arr.append(point)
  end
  arr
end

class UnitTest < MiniTest::Test
  def setup
    @eps = 1e-3
  end
  def test_1
    table = tabulate_f(1, 1, 1, -1, 1, 0.5)
    assert_equal(5, table.size)
    i = 0
    (-1..1).step(0.5) do |x|
      assert_in_delta(x, table[i].x, @eps)
      i += 1
    end
    assert_in_delta(2.0, table[0].val, @eps)
    assert_in_delta(1.25, table[1].val, @eps)
    assert_in_delta(0.0, table[2].val, @eps)
    assert_in_delta(0.5, table[3].val, @eps)
    assert_in_delta(1.0, table[4].val, @eps)
  end

  def test_2
    table = tabulate_f(0, 0, 1, -1, 1, 0.5)
    assert_equal(5, table.size)
    i = 0
    (-1..1).step(0.5) do |x|
      assert_in_delta(x, table[i].x, @eps)
      i += 1
    end
    assert_equal(-1, table[0].val)
    assert_equal(0, table[1].val)
    assert_equal(0, table[2].val)
    assert_equal(-1, table[3].val)
    assert_equal(Float::INFINITY, table[4].val)
  end
end

print "Please, enter a ="
a = gets.chomp.to_f

print "Please, enter b ="
b = gets.chomp.to_f

print "Please, enter c ="
c = gets.chomp.to_f

print "Please, enter x_beg ="
x_beg = gets.chomp.to_f

print "Please, enter x_end ="
x_end = gets.chomp.to_f

print "Please, enter dx ="
dx = gets.chomp.to_f

table = tabulate_f(a, b, c, x_beg, x_end, dx)
table.each do |item|
  puts "#{item.x} #{item.val}"
end