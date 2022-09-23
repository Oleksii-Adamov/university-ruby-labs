require 'minitest/autorun'

def y_if(x)
  if x > -4 && x <= 0
    (((x - 2).abs) / (x**2 * Math.cos(x))) ** (1 .fdiv 7)
  elsif x > 0 && x <= 12
    1 / (Math.tan(x + 1/Math.exp(x)) / Math.sin(x)**2) ** (2 .fdiv 7)
  elsif x < -4 || x > 12
    1 / (1 + x / (1 + x / (1 + x)))
  end
end

def y_case(x)
  case x
  when (-4.0).next_float..0
    (((x - 2).abs) / (x**2 * Math.cos(x))) ** (1 .fdiv 7)
  when (0.0).next_float..12
    1 / (Math.tan(x + 1/Math.exp(x)) / Math.sin(x)**2) ** (2 .fdiv 7)
  when -Float::INFINITY...-4
    1 / (1 + x / (1 + x / (1 + x)))
  when (12..)
    1 / (1 + x / (1 + x / (1 + x)))
  end
end

class UnitTestIf < MiniTest::Test
  def setup
    #do nothing
  end

  def test_1
    assert_in_delta(1.277, y_if(-1), 1e-3)
  end

  def test_2
    assert_in_delta 0.576, y_if(1.0), 1e-3
  end

  def test_3
    assert_in_delta(-0.818, y_if(-5.0), 1e-3)
  end

  def test_4
    assert_in_delta(0.129, y_if(13.0), 1e-3)
  end

end

class UnitTestCase < MiniTest::Test
  def setup
    #do nothing
  end

  def test_1
    assert_in_delta(1.277, y_case(-1), 1e-3)
  end

  def test_2
    assert_in_delta 0.576, y_case(1.0), 1e-3
  end

  def test_3
    assert_in_delta(-0.818, y_case(-5.0), 1e-3)
  end

  def test_4
    assert_in_delta(0.129, y_case(13.0), 1e-3)
  end

end