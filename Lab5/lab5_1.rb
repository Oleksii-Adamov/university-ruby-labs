require 'minitest/autorun'

def prm(a, b, f, n)
  h = (b - a) .fdiv n
  cur_x = a - (h .fdiv 2)
  sum = n.times.inject(0) do |sum, _|
    cur_x += h
    sum + f.call(cur_x)
  end
  sum * h
end

def trp(a, b, f, n)
  h = (b - a) .fdiv n
  result = f.call(a) .fdiv 2
  cur_x = a + h
  while cur_x < b
    result += f.call(cur_x)
    cur_x += h
  end
  result += f.call(b) .fdiv 2
  result * h
end

class UnitTest < MiniTest::Test
  def setup
    @f1 = Proc.new {|x| 1/((x+1)*Math.sqrt(x+1))}
    @f2 = Proc.new {|x| Math.tan(x / 2 + Math::PI / 4) ** 3}
    @a1 = 0.3
    @b1 = 0.3
    @a2 = 0.0
    @b2 = Math::PI / 4
  end

  def test_prm
    assert_in_delta(0, prm(@a1, @b1, @f1, 1000), 0.1)
    assert_in_delta(3.6, prm(@a2, @b2, @f2, 1000), 0.1)
  end

  def test_trp
    assert_in_delta(0, trp(@a1, @b1, @f1, 1000), 0.1)
    assert_in_delta(3.6, trp(@a2, @b2, @f2, 1000), 0.1)
  end
end