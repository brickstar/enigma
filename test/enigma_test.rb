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
    e = Enigma.new(my_message, key, date.find_today)

    assert_instance_of Enigma, e
  end

  def test_encrypt_can_handle_caps_and_symbols
    key = [63,71,73,14]
    my_message = "ThIs iS so AwEsoME!!?:)"
    date = Date.new
    e = Enigma.new(my_message, key, date.find_today)
    split_message = e.split_message(my_message)
    encrypted_message = e.encrypt(split_message)

    assert_equal "8T7&_UA.W[iO[1a\"11j/#&r", encrypted_message
  end

  def test_cipher_rotation_is_correct
    key = "56710"
    my_message = "this is so secret ..end.."
    date = Date.new
    e = Enigma.new(my_message, key, date.find_today)
    cipher = e.cipher(2)

    assert_instance_of Hash, cipher
    assert_equal "r", cipher["p"]
    assert_equal "s", cipher["q"]
    assert_equal "!", cipher["z"]
    assert_equal "g", cipher["e"]
    assert_equal "e", cipher["c"]
 end

 def test_split_message_can_split_into_groups_of_4
    key = "56710"
    my_message = "mattalex"
    date = Date.new
    e = Enigma.new(my_message, key, date.find_today)
    split_message = e.split_message(my_message)

    assert_equal (["matt","alex"]), split_message
 end

  def test_edge_case_split_on_string_not_evenly_divisible_by_4
    key = "56710"
    my_message = "this is so secret "
    date = Date.new
    e = Enigma.new(my_message, key, date.find_today)
    split_message = e.split_message(my_message)

    assert_equal (["this", " is ", "so s", "ecre", "t "]), split_message
  end

  def test_can_crack_4_letters
    my_message = "[R<m"
    date = Date.new
    e = Enigma.new(my_message, date.find_today)
    e.crack_key
    split_message = e.split_message(my_message)

    assert_equal "nd..", e.decrypt(split_message)
  end

  def test_can_crack_8_letters
    my_message = "hw<I[R<m"
    date = Date.new
    e = Enigma.new(my_message, date.find_today)
    e.crack_key
    split_message = e.split_message(my_message)

    assert_equal " ..end..", e.decrypt(split_message)
  end

  def test_can_crack_12_letters
    my_message = "P`sXhw<I[R<m"
    date = Date.new
    e = Enigma.new(my_message, date.find_today)
    e.crack_key
    split_message = e.split_message(my_message)

    assert_equal "cret ..end..", e.decrypt(split_message)
    end

  def test_can_handle_even_numbers
    my_message = "UW&_Va.W\\i&IP`sXhw<I[R<m"
    date = Date.new
    e = Enigma.new(my_message, date.find_today)
    e.crack_key
    split_message = e.split_message(my_message)

    assert_equal "his is so secret ..end..", e.decrypt(split_message)
  end

  def test_decrypt_can_handle_odd_numbers
    my_message = "XUW&_Va.W\\i&IP`sXhw<I[R<m"
    date = Date.new
    e = Enigma.new(my_message, date.find_today)
    e.crack_key
    split_message = e.split_message(my_message)

    assert_equal "this is so secret ..end..", e.decrypt(split_message)
  end

  def test_decrypt_can_handle_caps_and_numbers
    key = "18245"
    my_message = %Q(-hQORh2"_DVoXRdsVijM#h7.[N\\'`hw<I[R<m)
    date = Date.new
    e = Enigma.new(my_message, date.find_today)
    e.crack_key
    split_message = e.split_message(my_message)

    assert_equal "I cAn Do Whatever!!?? I want! ..end..", e.decrypt(split_message)
  end
end
