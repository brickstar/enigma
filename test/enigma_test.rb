require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/date'

require 'pry'

class EnigmaTest < Minitest::Test

  def test_enigma_class_exists
    key = "56710"
    my_message = "this is so secret ..end.."
    date = Date.new
    date.today
    e = Enigma.new(my_message, key, date.today)

    assert_instance_of Enigma, e
  end

  def test_enigma_class_can_take_message
    key = "56710"
    my_message = "this is so secret ..end.."
    date = Date.new
    date.today
    e = Enigma.new(my_message, key, date.today)

    assert_equal "this is so secret ..end..", output = e.encrypt(my_message)
  end

  def test_enigma_can_take_key
    key = "56710"
    my_message = "this is so secret ..end.."
    date = Date.new
    date.today
    e = Enigma.new(my_message, key, date.today)

    assert_equal "56710", key
  end

  def test_enigma_can_create_key
    key = "56710"
    my_message = "this is so secret ..end.."
    date = Date.new
    date.today
    e = Enigma.new(my_message, key, date.today)
    binding.pry
    assert_equal 63, 72, 73, 14, e.find_key
  end
end
