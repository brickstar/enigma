require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/date'
require './lib/encrypt'
require './lib/decrypt'
require 'pry'

class EnigmaTest < Minitest::Test

  def test_enigma_class_exists
    key_instance = KeyGenerator.new
    key = key_instance.offset_calculator
    my_message = "this is so secret ..end.."
    date = Date.new
    encrypt = Encrypt.new(key, date.find_today)
    e = Enigma.new(my_message)

    assert_instance_of Enigma, e
  end

  def test_cipher_rotation_is_correct
    key = "56710"
    my_message = "this is so secret ..end.."
    date = Date.new
    encrypt = Encrypt.new(my_message, key, date.find_today)
    cipher = encrypt.cipher(2)
    e = Enigma.new(encrypt)

    assert_instance_of Hash, cipher
    assert_equal "r", cipher["p"]
    assert_equal "s", cipher["q"]
    assert_equal "!", cipher["z"]
    assert_equal "g", cipher["e"]
    assert_equal "e", cipher["c"]
 end

 def test_split_message_can_split_into_groups_of_4
   key =
   my_message = "mattalex"
   date = Date.new
   encrypt_instance = Encrypt.new(my_message, key, date.find_today)
   split_message = encrypt_instance.split_message(my_message)

   assert_equal (["matt","alex"]), split_message
 end

  def test_edge_case_split_on_string_not_evenly_divisible_by_4
    key =
    my_message = "this is so secret "
    date = Date.new
    encrypt_instance = Encrypt.new(my_message, key, date.find_today)
    split_message = encrypt_instance.split_message(my_message)

    assert_equal (["this", " is ", "so s", "ecre", "t "]), split_message
  end


end
