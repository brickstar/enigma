require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_generator'
require 'pry'

class OffsetCalculator

  def offset_calculator
    calculator = []
    key = KeyGenerator.new
    key.random_key
    key.find_key
    date = Date.new
    date_today = date.find_today
    calculator << key.find_key[0] + date_today[0].to_i
    calculator << key.find_key[1] + date_today[1].to_i
    calculator << key.find_key[2] + date_today[2].to_i
    calculator << key.find_key[3] + date_today[3].to_i
    calculator
  end
end
