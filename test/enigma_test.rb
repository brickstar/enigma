require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require 'pry'

class EnigmaTest < Minitest::Test

def test_enigma_class_exists
enigma = Enigma.new

assert_instance_of Enigma, enigma
end





end
