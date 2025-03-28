require 'minitest/autorun'
class StringCalculator
  def self.addition(values)
    return 0 if values.empty?
    delimiter, values = extract_delimiter(values)
    values_array = values.split(delimiter)
    handle_negative_value(values_array)
    values_array.map(&:to_i).sum
  end
  
  def self.extract_delimiter(values)
    if values.start_with?("//")
      delimiter, values = values[2..].split("\n", 2)
      [Regexp.escape(delimiter), values]
    else
      [/,|\n/, values]
    end
  end

  def self.handle_negative_value(values)
    negatives = values.select { |v| v.to_i < 0 }
    raise "negative values not allowed: #{negatives.join(", ")}" if negatives.any?
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
  def test_addition_with_multiple_numbers
    assert_equal 30, StringCalculator.addition("4,5,6,7,8")
  end
  def test_adds_numbers_with_newline
    assert_equal 10, StringCalculator.addition("3\n2,5")
  end
  def test_adds_with_custom_delimiter
    assert_equal 10, StringCalculator.addition("//;\n2;8")
  end
  def test_raises_on_negative_number
    assert_raises(RuntimeError) { StringCalculator.addition("2,-3") }
  end
end

puts StringCalculator.addition("") # => 0
puts StringCalculator.addition("3") # => 3
puts StringCalculator.addition("7,5") # => 12
puts StringCalculator.addition("5,6,7,8,9")# => 35
puts StringCalculator.addition("9\n5,6") # => 20
puts StringCalculator.addition("//;\n30;88") # => 118
# puts StringCalculator.addition("8,-9") # unlock the line to see error