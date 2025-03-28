require 'minitest/autorun'
class StringCalculator
  def self.addition(values)
    return 0 if values.empty?
    values.split(",").map(&:to_i).sum
  end
end

class StringCalculatorTest < Minitest::Test
  def test_returns_zero_on_empty_string
    assert_equal 0, StringCalculator.addition("")
  end
  def test_returns_single_number
    assert_equal 7, StringCalculator.addition("7")
  end
  def test_adds_two_numbers
    assert_equal 10, StringCalculator.addition("6,4")
  end
end

puts StringCalculator.addition("") # => 0
puts StringCalculator.addition("3") # => 3
puts StringCalculator.addition("7,5") # => 12
