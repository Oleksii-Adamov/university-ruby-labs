require 'minitest/autorun'

def sum_negative(arr)
  arr.inject(0) { |sum, n| n < 0 ? sum + n : sum}
end

def product_between_min_max(arr)
  _, min_index = arr.each_with_index.min
  _, max_index = arr.each_with_index.max
  ([min_index,max_index].min+1..[min_index,max_index].max-1).inject(1) {|prod, i| prod * arr[i]}
end

def sort_increasing(arr)
  arr.sort
end

class UnitTest < MiniTest::Test
  def test_sum_negative
    assert_equal(-3, sum_negative(Array.new([-1, -2, 0, 1])))
    assert_equal(0, sum_negative(Array.new([1, 2, 0, 1])))
  end

  def test_product_between_min_max
    assert_equal(-8, product_between_min_max(Array.new([5, -3, -2, 4, 7, 5])))
    assert_equal(1, product_between_min_max(Array.new([2, -1, 5])))
  end

  def test_sort_increasing
    assert_equal(Array.new([-7, -2, 0, 1, 2, 5]), sort_increasing(Array.new([0, 1, -2, 5, -7, 2])))
  end
end