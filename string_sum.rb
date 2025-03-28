require 'minitest/autorun'
class StringCalculator
  def self.addition(values)
    return 0 if values.empty?
    values.to_i
  end
end

class StringCalculatorTest < Minitest::Test
  def test_returns_zero_on_empty_string
    assert_equal 0, StringCalculator.addition("")
  end
  def test_returns_single_number
    assert_equal 7, StringCalculator.addition("7")
  end
end

puts StringCalculator.addition("") # => 0
puts StringCalculator.addition("3") # => 3