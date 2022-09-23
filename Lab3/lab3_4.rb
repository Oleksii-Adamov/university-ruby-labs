require 'minitest/autorun'

def fact(n)
  result = 1
  for i in 2..n
    result *= i
  end
  result
end

def func1(eps)
  result = 0
  for n in (2..)
    addend = (fact(n - 1) .fdiv fact(n + 1)) ** (n * (n + 1))
    break if addend < eps
    result += addend
  end
  result
end

def func2_my_ln(x, eps)
  result = 0
  eps_for_ln = eps / 2
  for n in (0..)
    addend = ((x - 1)**(2*n + 1)) .fdiv (2*n + 1) * (x + 1)**(2*n + 1)
    break if addend < eps_for_ln
    result += addend
  end
  result *= 2
  result
end

def func3(eps)
  result = 0
  for n in (1..)
    addend = (fact(4*n - 1) * fact(2*n - 1)) .fdiv fact(4*n) * 2**(2*n) * fact(2*n)
    break if addend < eps
    result += addend
  end
  result
end

class UnitTest < MiniTest::Test
  def setup
    @eps = 1e-5
  end

  def test_1
    assert_in_delta(2.14e-5, func1(@eps), @eps)
  end

  def test_2
    assert_in_delta(Math.log(2.0), func2_my_ln(2.0, @eps), @eps)
    assert_in_delta(Math.log(3.0), func2_my_ln(3.0, @eps), @eps)
    assert_in_delta(Math.log(4.0), func2_my_ln(4.0, @eps), @eps)
  end

  def test_3
    assert_in_delta(0.03345, func3(@eps), @eps)
  end
end