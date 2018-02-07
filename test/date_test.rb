require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/date'

class DateTest < Minitest::Test
  def test_date_class_exists
    date = Date.new

    assert_instance_of Date, date
  end

  def test_double_the_date_function
    date = Date.new

    assert_equal "7524", date.find_today
  end
end
