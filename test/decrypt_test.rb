require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/date'
require './lib/encrypt'
require './lib/decrypt'
require 'pry'

class DecryptTest < Minitest::Test
  def test_decrypt_class_instanstiated
    key = "56710"
    my_message = "8U7&_VA.W\\iO[2a\"12j/#'r"
    date = Date.new
    decrypt= Decrypt.new(my_message, key, date.find_today)

    assert_instance_of Decrypt, decrypt
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
