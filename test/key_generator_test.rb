require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/date'
require './lib/encrypt'
require './lib/decrypt'
require 'pry'

class KeyGeneratorTest < Minitest::Test

def test_enigma_can_create_key
  skip
  key = "56710"
  my_message = "this is so secret ..end.."
  date = Date.new
  today = date.find_today
  e = Enigma.new(my_message, key, today)

  assert_equal [63, 72, 73, 14], e.find_key
end

end
