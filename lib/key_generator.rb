require './lib/date'

class KeyGenerator

  def random_key
    @key = rand(9999..100000).to_s
  end

  def find_key(key = @key)
    key_array = []
    key_array << key[0..1].to_i
    key_array << key[1..2].to_i
    key_array << key[2..3].to_i
    key_array << key[3..4].to_i
    key_array
  end

  def offset_calculator
    calculator = []
    date = Date.new
    date_today = date.find_today
    calculator << key.find_key[0] + date_today[0].to_i
    calculator << key.find_key[1] + date_today[1].to_i
    calculator << key.find_key[2] + date_today[2].to_i
    calculator << key.find_key[3] + date_today[3].to_i
    calculator
  end

end
