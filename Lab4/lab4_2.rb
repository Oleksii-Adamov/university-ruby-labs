require 'matrix'
require 'minitest/autorun'

def mult_matrix_by_scalar(matrix, scalar)
  matrix_arr = matrix.to_a
  matrix_arr.map! do |row|
    row.map! {|elem| elem * scalar}
  end
  Matrix.rows(matrix_arr)
end

class UnitTest < MiniTest::Test
  def setup
    @n_rows = 8
    @n_columns = 8
  end

  def test_rand_100
    100.times do
      matrix = Matrix.build(@n_rows, @n_columns) {rand(100)}
      scalar = rand(100)
      result_matrix_library = (matrix * scalar).to_a
      result_matrix_mine = mult_matrix_by_scalar(matrix, scalar).to_a
      matrix = matrix.to_a
      for i in (0...@n_rows)
        for j in (0...@n_columns)
          assert_equal(matrix[i][j] * scalar, result_matrix_mine[i][j])
          assert_equal(matrix[i][j] * scalar, result_matrix_library[i][j])
        end
      end
    end
  end
end
