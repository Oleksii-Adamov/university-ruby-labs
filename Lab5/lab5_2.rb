require 'minitest/autorun'

def series(x, n, eps = 0.001)
  f = Proc.new {|i, i_fact| (Math.log(3) ** i) * (x ** i) / i_fact}
  result = 0
  i_fact = 1
  if n < 0
    for i in (0..)
      if i > 1
        i_fact *= i
      end
      addend = f.call(i, i_fact)
      break if addend < eps
      result += addend
    end
  else
    for i in (0..n)
      if i > 1
        i_fact *= i
      end
      result += f.call(i, i_fact)
    end
  end
  result
end

class UnitTest < MiniTest::Test
  def test_finite
    eps = 0.001
    assert_in_delta(1.116, series(0.1, 3), eps)
    assert_in_delta(1.727, series(0.5, 3), eps)
    assert_in_delta(2.923, series(1, 3), eps)
  end

  def test_infinite
    eps = 0.001
    assert_in_delta(1.116, series(0.1, -1, eps), eps)
    assert_in_delta(1.732, series(0.5, -1, eps), eps)
    assert_in_delta(3, series(1, -1, eps), eps)
  end
end