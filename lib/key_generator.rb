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
end
