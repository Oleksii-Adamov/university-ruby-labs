require 'minitest/autorun'

class Date
  attr_accessor :day, :month, :year

  def initialize(day, month, year)
    @day = day
    @month = month
    @year = year
  end

  def to_string
    "#{day}.#{month}.#{year}"
  end

end

class Student
  attr_accessor :id, :surname, :name, :second_name, :birth_date, :address, :phone, :faculty, :course, :group

  def initialize(id, surname, name, second_name, birth_date, address, phone, faculty, course, group)
    @id = id
    @surname = surname
    @name = name
    @second_name = second_name
    @birth_date = birth_date
    @address = address
    @phone = phone
    @faculty = faculty
    @course = course
    @group = group
  end

  def to_string
    "#{id} #{surname} #{name} #{second_name} #{birth_date.to_string} #{address} #{phone} #{faculty} #{course} #{group}"
  end
end

class StudentDB
  attr_accessor :student_arr

  def initialize(student_arr = nil)
    if student_arr.nil?
      @student_arr = Array.new
    else
      @student_arr = student_arr
    end
  end

  def add(student)
    @student_arr.append(student)
  end

  def students_by_faculty(faculty)
    @student_arr.select { |student| student.faculty == faculty}
  end

  def students_by_faculties_and_courses
    ret_hashmap = Hash.new
    faculties = @student_arr.uniq{|student| student.faculty}.map { |student| student.faculty}
    faculties.each do |faculty|
      faculty_students = students_by_faculty(faculty)
      courses = faculty_students.uniq{|student| student.course}.map{|student| student.course}
      courses.each do |course|
        ret_hashmap[[faculty, course]] = faculty_students.select{|student| student.course == course}
      end
    end
    ret_hashmap
  end

  def students_born_past(year)
    @student_arr.select { |student| student.birth_date.year > year}
  end

  def students_group_list(group)
    group_students = @student_arr.select { |student| student.group == group}
    group_students.sort_by{|student| student.surname}
  end
end

class UnitTest < MiniTest::Test
  def setup
    @studentDB = StudentDB.new([Student.new(0, "A", "A", "A", Date.new(17, 3, 2003), "A", "A", "F1", "3", "A"),
                                Student.new(1, "B", "B", "B", Date.new(17, 3, 2004), "B", "B", "F2", "2", "B"),
                                Student.new(2, "C", "C", "C", Date.new(19, 2, 2003), "C", "C", "F1", "3", "A"),
                                Student.new(3, "D", "D", "D", Date.new(12, 1, 2005), "D", "D", "F2", "1", "D")])
  end
  def test_students_by_faculty
    students = @studentDB.students_by_faculty("F1")
    assert_equal(2, students.size)
    assert_equal("0 A A A 17.3.2003 A A F1 3 A", students[0].to_string)
    assert_equal("2 C C C 19.2.2003 C C F1 3 A", students[1].to_string)
  end

  def test_students_by_faculties_and_courses
    hashmap = @studentDB.students_by_faculties_and_courses
    assert(3, hashmap.keys.size)
    assert(hashmap.keys.include? ["F1", "3"])
    assert(hashmap.keys.include? ["F2", "2"])
    assert(hashmap.keys.include? ["F2", "1"])
    assert_equal(2, hashmap[["F1", "3"]].size)
    assert_equal("0 A A A 17.3.2003 A A F1 3 A", hashmap[["F1", "3"]][0].to_string)
    assert_equal("2 C C C 19.2.2003 C C F1 3 A", hashmap[["F1", "3"]][1].to_string)
    assert_equal(1, hashmap[["F2", "2"]].size)
    assert_equal("1 B B B 17.3.2004 B B F2 2 B", hashmap[["F2", "2"]][0].to_string)
    assert_equal(1, hashmap[["F2", "1"]].size)
    assert_equal("3 D D D 12.1.2005 D D F2 1 D", hashmap[["F2", "1"]][0].to_string)
  end

  def test_students_born_past
    students = @studentDB.students_born_past(2003)
    assert_equal(2, students.size)
    assert_equal("1 B B B 17.3.2004 B B F2 2 B", students[0].to_string)
    assert_equal("3 D D D 12.1.2005 D D F2 1 D", students[1].to_string)
  end

  def test_students_group_list
    students = @studentDB.students_group_list("A")
    assert_equal(2, students.size)
    assert_equal("0 A A A 17.3.2003 A A F1 3 A", students[0].to_string)
    assert_equal("2 C C C 19.2.2003 C C F1 3 A", students[1].to_string)
  end
end