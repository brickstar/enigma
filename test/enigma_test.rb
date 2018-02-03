require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require 'pry'

class EnigmaTest < Minitest::Test

  def test_enigma_class_exists
    key = "12345"
    my_message = "this is so secret ..end.."
    e = Enigma.new(my_message, key)

    assert_instance_of Enigma, e
  end

  def test_enigma_class_can_take_message
    key = "12345"
    my_message = "this is so secret ..end.."
    e = Enigma.new(my_message, key)

    assert_equal "this is so secret ..end..", output = e.encrypt(my_message)
  end

  def test_enigma_can_take_key
    my_message = "this is so secret ..end.."
    key = "12345"
    e = Enigma.new(my_message, key)

    assert_equal "12345", key
  end
end
