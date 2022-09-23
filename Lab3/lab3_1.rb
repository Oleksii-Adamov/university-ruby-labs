require 'minitest/autorun'

# 1)
def func_a(a, b)
  !(a || b) && (a && !b)
end

def func_b(a, b, c, x, y, z)
  (z != y).object_id <= (6 >= y).object_id && a || b && c && x >= 1.5
end

def func_c(x, y, z)
  (8 - x*2 <= z) && (x**2 <= y**2) || (z >= 15)
end

def func_d(x, y, z)
  x > 0 && y < 0 || z >= (x*y-y/x) + (-z)
end

def func_e(a, b, c)
  !(a || b && !(c || (!a || b)))
end

def func_f(x, y, z)
  x**2 + y**2 >= 1 && x >= 0 && y >= 0
end

def func_g(a, b, c)
  (a && (c && b != b || a) || c) && b
end

# 2)
def func_second(a, p)
  ((Math.log(a) > a) || !p) && (Math.sqrt(a) < a**4)
end

#Tests
class UnitTest1 < MiniTest::Unit::TestCase
  def setup
    @a = true
    @b = false
    @c = true
    @x = 2
    @y = 10
    @z = -50
  end

  def test_a
    assert_equal(false, func_a(@a, @b))
  end

  def test_b
    assert_equal(false, func_b(@a, @b, @c, @x, @y, @z))
  end

  def test_c
    assert_equal(false, func_c(@x, @y, @z))
  end

  def test_d
    assert_equal(false, func_d(@x, @y, @z))
  end

  def test_e
    assert_equal(false, func_e(@a, @b, @c))
  end

  def test_f
    assert_equal(true, func_f(@x, @y, @z))
  end

  def test_g
    assert_equal(false, func_g(@a, @b, @c))
  end

end

class UnitTest2 < MiniTest::Unit::TestCase
  def setup
    @a = 2.5
    @p = true
  end
  def test
    assert_equal(false, func_second(@a, @p))
  end
end