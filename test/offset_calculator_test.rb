require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_generator'
require './lib/offset_calculator'
require 'pry'

class OffsetCalculatorTest < Minitest::Test

  def test_key_generator_is_instantiated
    calculator = OffsetCalculator.new
binding.pry
    assert_instance_of OffsetCalculator, calculator
  end
end
