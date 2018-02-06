require 'minitest/autorun'
require 'minitest/pride'
require './lib/crack'
require 'pry'

class CrackTest < MiniTest::Test

  def test_crack_exists
    crack = Crack.new(message)

    assert_equal crack, Crack.new(message)
  end

  def test_can_crack_one_letter
    message = "[R<m"
    crack = Crack.new(message)

    assert_equal "n", cipher(19)[0]
  end

#   def test_it_can_crack_a_key
#     message = "8UW&_Va.W\\i&IP`sXhw<I[R<m"
#     crack = Crack.new(message)
# # binding.pry
#     assert_equal "this is so secret ..end..", crack.crack_key
#   end
end
