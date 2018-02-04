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
    date.find_today
    e = Enigma.new(my_message, key, date.today)

    assert_instance_of Enigma, e
  end

  # def test_enigma_class_can_take_message
  #   key = "56710"
  #   my_message = "this is so secret ..end.."
  #   date = Date.new
  #   date.find_today
  #   e = Enigma.new(my_message, key, date.today)
  #
  #   assert_equal "this is so secret ..end..", output = e.encrypt(my_message)
  # end

  def test_enigma_can_take_key
    key = "56710"
    my_message = "this is so secret ..end.."
    date = Date.new
    date.find_today
    e = Enigma.new(my_message, key, date.today)

    assert_equal "56710", key
  end

  def test_enigma_can_create_key
    key = "56710"
    my_message = "this is so secret ..end.."
    date = Date.new
    today = date.find_today
    e = Enigma.new(my_message, key, today)

    assert_equal [63, 72, 73, 14], e.find_key
  end

  def test_cipher_rotation_is_correct
    key = "56710"
    my_message = "this is so secret ..end.."
    date = Date.new
    today = date.find_today
    e = Enigma.new(my_message, key, today)
    cipher = e.cipher(2)

    assert_instance_of Hash, cipher
    assert_equal "r", cipher["p"]
    assert_equal "s", cipher["q"]
    assert_equal "b", cipher["z"]
    assert_equal "g", cipher["e"]
    assert_equal "e", cipher["c"]
 end

 def test_encrypt_a_single_letter
    key = "56710"
    my_message = "t"
    date = Date.new
    today = date.find_today
    e = Enigma.new(my_message, key, today)
    cipher = e.cipher(63)

    assert_equal "e", cipher["t"]
    assert_equal "v", cipher["k"]
    assert_equal "g", cipher["v"]
    assert_equal "k", cipher["z"]
    assert_equal "c", cipher["r"]
 end

 # def test_encrypt_can_take_4_rotating_letters
 #    key = "56710"
 #    my_message = "mattalex"
 #    date = Date.new
 #    today = date.find_today
 #    e = Enigma.new(my_message, key, today)
 #
 #    assert_equal "x", e.cipher(63)["m"]
 #    assert_equal "h", e.cipher(14)["t"]
 #    assert_equal "xuoh", e.encrypt(my_message)
 # end

 def test_split_message_can_split_into_groups_of_4
   key = "56710"
   my_message = "mattalex"
   date = Date.new
   today = date.find_today
   e = Enigma.new(my_message, key, today)
   e.split_message(my_message)
# binding.pry
   assert_equal (["matt","alex"]), e.split_message(my_message)
 end

  def test_edge_case_split_on_string_not_evenly_divisible_by_4
    key = "56710"
    my_message = "this is so secret "
    date = Date.new
    today = date.find_today
    e = Enigma.new(my_message, key, today)
    e.split_message(my_message)

    assert_equal (["this", " is ", "so s", "ecre", "t "]), e.split_message(my_message)
  end

  def test_encrypt_can_iterate_and_handle_more_than_4
    key = "56710"
    my_message = "this is so secret "
    date = Date.new
    today = date.find_today
    e = Enigma.new(my_message, key, today)
    message = e.split_message(my_message)
    new_message = e.encrypt(message)
    binding.pry
    assert_equal
  end
end
