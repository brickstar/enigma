require './lib/date'

class KeyGenerator

  def random_key
    @key = rand(9999..100000).to_s
  end

  def find_key(key = @key)
    @random_a = key[0..1].to_i
    @random_b = key[1..2].to_i
    @random_c = key[2..3].to_i
    @random_d = key[3..4].to_i
  end

  def offset_calculator
    @key_array = []
    date = Date.new
    date_today = date.find_today
    @key_array << @random_a + date_today[0].to_i
    @key_array << @random_b + date_today[1].to_i
    @key_array << @random_c + date_today[2].to_i
    @key_array << @random_d + date_today[3].to_i
  end
end
