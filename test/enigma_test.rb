require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require 'pry'

class EnigmaTest < Minitest::Test

def test_enigma_class_exists
my_message = "this is so secret ..end.."
e = Enigma.new(my_message)

assert_instance_of Enigma, e
end

def test_enigma_class_can_take_message
my_message = "this is so secret ..end.."
e = Enigma.new(my_message)

assert_equal "this is so secret ..end..", output = e.encrypt(my_message)
end

end
