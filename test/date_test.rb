require 'minitest/autorun'
require 'minitest/pride'
require './lib/date'

class DateTest < Minitest::Test
  def test_date_class_exists
    date = Date.new

    assert_instance_of Date, date
  end


end
