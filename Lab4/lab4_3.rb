require 'minitest/autorun'
def print_matrix(matrix)
  matrix.each {|row| puts row.inspect}
  print "\n"
end

def GaussSolveEffective(matrix_a, vector_b)
  for index in (0...matrix_a.length)
    carry_element = matrix_a[index][index]
    vector_b[index] = vector_b[index] .fdiv carry_element
    for j in (index...matrix_a[index].length)
      matrix_a[index][j] = matrix_a[index][j] .fdiv carry_element
    end

    for i in (index+1...matrix_a.length)
      mult_element = matrix_a[i][index]
      for j in (index...matrix_a[i].length)
        matrix_a[i][j] -= matrix_a[index][j] * mult_element
      end
      vector_b[i] -= vector_b[index] * mult_element
    end
  end

  solution = Array.new(vector_b.length)
  for i in (vector_b.length-1).downto(0)
    solution[i] = vector_b[i]
    for j in (i+1...matrix_a.length)
      solution[i] -= matrix_a[i][j] * solution[j]
    end
  end

  solution
end

def GaussSolveClean(matrix_a, vector_b)
  matrix_a = matrix_a.each_with_index.map do |row, index|
    carry_element = row[index]
    vector_b[index] = vector_b[index] .fdiv carry_element
    row.map! {|elem| elem .fdiv carry_element}
    for j in (index+1...row.length)
      mult_element = matrix_a[j][index]
      matrix_a[j] = matrix_a[j].each_with_index.map {|elem, i| elem - row[i] * mult_element}
      vector_b[j] -= vector_b[index] * mult_element
    end
    row
  end

  solution = Array.new(vector_b.length)
  for i in (vector_b.length-1).downto(0)
    solution[i] = vector_b[i]
    for j in (i+1...matrix_a.length)
      solution[i] -= matrix_a[i][j] * solution[j]
    end
  end

  solution
end

def GenerateMatrixAndVector(n)
  matrix = (0...n).map{Array.new(n)}
  vector = Array.new(n)
  for i in (0...matrix.length)
    for j in (0...matrix[i].length)
      if i == j
        matrix[i][j] = 2
      else
        matrix[i][j] = 3
      end
    end
  end
  vector = vector.each_with_index.map{|_, index| index + 1}

  return matrix, vector
end

class UnitTest < MiniTest::Test
  def setup
    @eps = 1e-5
  end
  def test_3_Effective
    matrix, vector = GenerateMatrixAndVector(3)
    solution = GaussSolveEffective(matrix, vector)
    assert_in_delta(1.25, solution[0], @eps)
    assert_in_delta(0.25, solution[1], @eps)
    assert_in_delta(-0.75, solution[2], @eps)
  end

  def test_3_Clean
    matrix, vector = GenerateMatrixAndVector(3)
    solution = GaussSolveClean(matrix, vector)
    assert_in_delta(1.25, solution[0], @eps)
    assert_in_delta(0.25, solution[1], @eps)
    assert_in_delta(-0.75, solution[2], @eps)
  end

  def test_5_Effective
    matrix, vector = GenerateMatrixAndVector(5)
    solution = GaussSolveEffective(matrix, vector)
    assert_in_delta(31.0 / 14, solution[0], @eps)
    assert_in_delta(17.0 / 14, solution[1], @eps)
    assert_in_delta(3.0 / 14, solution[2], @eps)
    assert_in_delta(-11.0 / 14, solution[3], @eps)
    assert_in_delta(-25.0 / 14, solution[4], @eps)
  end

  def test_5_Clean
    matrix, vector = GenerateMatrixAndVector(5)
    solution = GaussSolveClean(matrix, vector)
    assert_in_delta(31.0 / 14, solution[0], @eps)
    assert_in_delta(17.0 / 14, solution[1], @eps)
    assert_in_delta(3.0 / 14, solution[2], @eps)
    assert_in_delta(-11.0 / 14, solution[3], @eps)
    assert_in_delta(-25.0 / 14, solution[4], @eps)
  end
end
