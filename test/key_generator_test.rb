require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_generator'
require 'pry'

class KeyGeneratorTest < Minitest::Test

  def test_key_generator_is_instantiated
    key = KeyGenerator.new

    assert_instance_of KeyGenerator, key
  end

end
