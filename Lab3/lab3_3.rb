require 'minitest/autorun'

# 1)
def func1(x)
  result = 1
  for i in 1..10 do
    #puts (-1)**i
    result += ((-1)**i) * ((i + 1) .fdiv (i + 2)) * x**i
  end
  result
end

# 4)
def func4(n)
  result = 0
  for i in 1..n
    denominator = 0
    for x in 1..i
      denominator += Math.sin(x)
    end
    result += 1 / denominator
  end
  result
end

class UnitTest < MiniTest::Test
  def setup
    # do nothing
  end

  def test_1_1
    assert_in_delta(628.005, func1(2), 1e-3)
  end

  def test_4_1
    assert_in_delta(1.759, func4(2) ,1e-3)
  end

  def test_4_2
    assert_in_delta(1.188, func4(1), 1e-3)
  end
end