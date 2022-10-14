require 'minitest/autorun'

class Baggage

  def initialize(num, weight)
    @num = num
    @weight = weight
  end

  def num
    @num
  end

  def weight
    @weight
  end

  def mean_weight
    @weight .fdiv @num
  end
end

class Passenger

  def initialize(id, baggage)
    @id = id
    @baggage = baggage
  end

  def id
    @id
  end

  def baggage
    @baggage
  end
end

class PassengersInfo

  def initialize(passengers)
    @passengers = passengers
  end

  private

  def mean_weight
    sum = @passengers.reduce(0) {|acc, passenger| acc + passenger.baggage.weight}
    sum .fdiv @passengers.length
  end

  def mean_num
    sum = @passengers.reduce(0) {|acc, passenger| acc + passenger.baggage.num}
    sum .fdiv @passengers.length
  end

  public

  def a_task
    mean = mean_weight
    delta = 0.3
    res_passenger = @passengers.find {|passenger| not (passenger.baggage.mean_weight - mean).abs > delta}
    if res_passenger.nil?
      return nil
    else
      return res_passenger.baggage
    end
  end

  def b_task
    num_more_than_two = @passengers.select{|passenger| passenger.baggage.num > 2}.length
    mean = mean_num
    num_more_than_mean = @passengers.select{|passenger| passenger.baggage.num > mean}.length
    return num_more_than_two, num_more_than_mean
  end

  def c_task
    delta = 0.5
    not @passengers.find {|passenger| @passengers.select{|second_passenger| passenger.baggage.num == second_passenger.baggage.num and
      not (passenger.baggage.weight - second_passenger.baggage.weight).abs > delta}.length > 0}.nil?
  end

  def d_task
    not @passengers.find {|passenger| @passengers.select{|second_passenger| passenger.baggage.num > second_passenger.baggage.num and
      passenger.baggage.weight > second_passenger.baggage.weight}.length == @passengers.length - 1}.nil?
  end

  def e_task
    not @passengers.find {|passenger| passenger.baggage.num == 1 and passenger.baggage.weight < 30}.nil?
  end
end

class UnitTest < MiniTest::Test
  def setup
    passengers = [Passenger.new(0, Baggage.new(1, 25.0)), Passenger.new(1, Baggage.new(2, 20.3)),
                  Passenger.new(2, Baggage.new(2, 20.0)), Passenger.new(3, Baggage.new(3, 30.0))]
    @passenger_info = PassengersInfo.new(passengers)
  end

  def test_a
    assert(@passenger_info.a_task.nil?)
  end

  def test_b
    num_more_than_two, num_more_than_mean = @passenger_info.b_task
    assert_equal(1, num_more_than_two)
    assert_equal(1, num_more_than_mean)
  end

  def test_c
    assert(@passenger_info.c_task)
  end

  def test_d
    assert(@passenger_info.d_task)
  end

  def test_e
    assert(@passenger_info.e_task)
  end
end
