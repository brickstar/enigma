require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/date'
require './lib/encrypt'
require './lib/decrypt'
require 'pry'

class EnigmaTest < Minitest::Test

  def test_enigma_class_exists
    key = "56710"
    my_message = "this is so secret ..end.."
    date = Date.new
    encrypt = Encrypt.new(key, date.find_today)
    e = Enigma.new(my_message)

    assert_instance_of Enigma, e
  end

  def test_encrypt_class_can_take_message
    key = "56710"
    my_message = "this is so secret ..end.."
    date = Date.new
    encrypt = Encrypt.new(my_message, key, date.find_today)
    e = Enigma.new(encrypt)

    assert_equal "this is so secret ..end..", output = encrypt.message
  end

  def test_enigma_can_take_key
    key = "56710"
    my_message = "this is so secret ..end.."
    date = Date.new
    encrypt = Encrypt.new(my_message, key, date.find_today)
    e = Enigma.new(encrypt)

    assert_equal "56710", key
  end

  # def test_enigma_can_create_key
  #   skip
  #   key = "56710"
  #   my_message = "this is so secret ..end.."
  #   date = Date.new
  #   today = date.find_today
  #   e = Enigma.new(my_message, key, today)
  #
  #   assert_equal [63, 72, 73, 14], e.find_key
  # end

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

 def test_encrypt_a_single_letter
   key = "56710"
   my_message = "t"
   date = Date.new
   encrypt = Encrypt.new(my_message, key, date.find_today)
   cipher = encrypt.cipher(63)
   e = Enigma.new(encrypt)

   assert_equal "X", cipher["t"]
   assert_equal "O", cipher["k"]
   assert_equal "Z", cipher["v"]
   assert_equal "^", cipher["z"]
   assert_equal "V", cipher["r"]
 end

 def test_encrypt_can_take_4_rotating_letters
   key = "56710"
   my_message = "mattalex"
   date = Date.new
   encrypt_instance = Encrypt.new(my_message, key, date.find_today)
   split_message = encrypt_instance.split_message(my_message)
   encrypted_message = encrypt_instance.encrypt(split_message)

   assert_equal "Q", encrypted_message[0]
   assert_equal "'", encrypted_message[3]
   assert_equal "QNb'EYS+", encrypted_message
 end

 def test_split_message_can_split_into_groups_of_4
   key = "56710"
   my_message = "mattalex"
   date = Date.new
   encrypt_instance = Encrypt.new(my_message, key, date.find_today)
   split_message = encrypt_instance.split_message(my_message)

   assert_equal (["matt","alex"]), split_message
 end

  def test_edge_case_split_on_string_not_evenly_divisible_by_4
    key = "56710"
    my_message = "this is so secret "
    date = Date.new
    encrypt_instance = Encrypt.new(my_message, key, date.find_today)
    split_message = encrypt_instance.split_message(my_message)

    assert_equal (["this", " is ", "so s", "ecre", "t "]), split_message
  end

  def test_encrypt_can_iterate_and_handle_more_than_4
    key = "56710"
    my_message = "this is so secret "
    date = Date.new
    encrypt_instance = Encrypt.new(my_message, key, date.find_today)
    split_message = encrypt_instance.split_message(my_message)
    encrypted_message = encrypt_instance.encrypt(split_message)

    assert_equal "XUW&_Va.W\\i&IP`sXh", encrypted_message
  end

  def test_encrypt_can_handle_caps_and_symbols
    key = "56710"
    my_message = "ThIs iS so AwEsoME!!?:)"
    date = Date.new
    encrypt_instance = Encrypt.new(my_message, key, date.find_today)
    split_message = encrypt_instance.split_message(my_message)
    encrypted_message = encrypt_instance.encrypt(split_message)

    assert_equal "8U7&_VA.W\\iO[2a\"12j/#'r", encrypted_message
  end

  def test_decrypt
    key = "56710"
    my_message = "8U7&_VA.W\\iO[2a\"12j/#'r"
    date = Date.new
    decrypt_instance = Decrypt.new(my_message, key, date.find_today)
    split_message = decrypt_instance.split_message(my_message)
    decrypted_message = decrypt_instance.decrypt(split_message)

    assert_equal "ThIs iS so AwEsoME!!?:)", decrypted_message
  end
end
