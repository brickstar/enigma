require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/date'
require './lib/encrypt'
require './lib/decrypt'
require 'pry'

class EncryptTest < Minitest::Test
  def test_encrypt_class_exists
    key = "56710"
    my_message = "this is so secret ..end.."
    date = Date.new
    encrypt = Encrypt.new(my_message, key, date.find_today)

    assert_instance_of Encrypt, encrypt
  end

  def test_enigma_can_take_key
    key = "56710"
    my_message = "this is so secret ..end.."
    date = Date.new
    encrypt = Encrypt.new(my_message, key, date.find_today)
    e = Enigma.new(encrypt)

    assert_equal "56710", key
  end

  def test_encrypt_class_can_take_message
    key = "56710"
    my_message = "this is so secret ..end.."
    date = Date.new
    encrypt = Encrypt.new(my_message, key, date.find_today)
    e = Enigma.new(encrypt)

    assert_equal "this is so secret ..end..", output = encrypt.message
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
end
