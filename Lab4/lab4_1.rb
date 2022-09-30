require 'minitest/autorun'
# O(n^2)
def find_duplicates_squared(arr)
  arr.find_all {|element| arr.count(element) > 1}.uniq
end
# O(n)
def find_duplicates_linear(arr)
  hash_count = Hash.new()
  hash_count.default = 0
  arr.find_all {|element|
    hash_count[element] += 1
    hash_count[element] == 2
  }
end

class UnitTest < MiniTest::Test
  def test_book_example_one_group
    arr = [1, 2, 2, 3]
    duplicates = find_duplicates_squared(arr)
    assert_equal(1, duplicates.length)
    assert_equal(2, duplicates[0])
    duplicates = find_duplicates_linear(arr)
    assert_equal(1, duplicates.length)
    assert_equal(2, duplicates[0])
  end

  def test_no_duplicates
    arr = [1, 2, 3, 4]
    duplicates = find_duplicates_squared(arr)
    assert_equal(0, duplicates.length)
    duplicates = find_duplicates_linear(arr)
    assert_equal(0, duplicates.length)
  end

  def test_multple_groups
    arr = [7, 5, 4, 7, 5, 4]
    duplicates = find_duplicates_squared(arr)
    assert_equal(3, duplicates.length)
    assert(duplicates.include?(7))
    assert(duplicates.include?(5))
    assert(duplicates.include?(4))
    duplicates = find_duplicates_linear(arr)
    assert_equal(3, duplicates.length)
    assert(duplicates.include?(7))
    assert(duplicates.include?(5))
    assert(duplicates.include?(4))
  end
end