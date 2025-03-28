require 'minitest/autorun'
class StringCalculator
  def self.addition(values)
    return 0 if values.empty?
  end
end

class StringCalculatorTest < Minitest::Test
  def test_returns_zero_on_empty_string
    assert_equal 0, StringCalculator.addition("")
  end
end

puts StringCalculator.addition("") # => 0