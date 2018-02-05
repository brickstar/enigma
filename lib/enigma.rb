require 'pry'

class Enigma
  attr_reader :key_array,
              :message

  def initialize(message, key = "56710", date_today)
    @message    = message
    @key        = key
    @key_array  = []
    @date_today = date_today

  end

  def encrypt(message)
    message = message.map do |array|
    result = []
    result << cipher(63)[array[0]]
    result << cipher(72)[array[1]]
    result << cipher(73)[array[2]]
    result << cipher(14)[array[3]]
    end
    message.join
   end

   def decrypt(message)
     message = message.map do |array|
     result = []
     result << cipher(-63)[array[0]]
     result << cipher(-72)[array[1]]
     result << cipher(-73)[array[2]]
     result << cipher(-14)[array[3]]
     end
     message.join
    end

  def cipher(rotation)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    new_hash = Hash[characters.zip(rotated_characters)]
  end

  def find_key
    random_a = @key[0..1].to_i
    random_b = @key[1..2].to_i
    random_c = @key[2..3].to_i
    random_d = @key[3..4].to_i
    date_a   = @date_today[0].to_i
    date_b   = @date_today[1].to_i
    date_c   = @date_today[2].to_i
    date_d   = @date_today[3].to_i
    @key_array << random_a + date_a
    @key_array << random_b + date_b
    @key_array << random_c + date_c
    @key_array << random_d + date_d
  end

  def split_message(my_message)
    message.chars.each_slice(4).map(&:join)
  end
end
