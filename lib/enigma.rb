require 'pry'
require './lib/decrypt.rb'
require './lib/cipher_module.rb'
require './lib/key_generator.rb'

class Enigma
  include Cipher
  attr_reader :message,
              :key,
              :date

  def initialize(message, key, date = 7524)
    @message = message
    @key     = key
    @date    = date
    @cipher_a = date[0]
    @cipher_b = date[1]
    @cipher_c = date[2]
    @cipher_d = date[3]
  end

  def encrypt(message = @message)
    message = message.map do |array|
    result = []
    result << cipher(@key[0])[array[0]]
    result << cipher(@key[1])[array[1]]
    result << cipher(@key[2])[array[2]]
    result << cipher(@key[3])[array[3]]
    end
    message.join
  end

  def decrypt(message)
    if message.join.length % 4 == 0
      message = message.map do |array|
      result = []
      result << cipher(@cipher_a)[array[-4]]
      result << cipher(@cipher_b)[array[-3]]
      result << cipher(@cipher_c)[array[-2]]
      result << cipher(@cipher_d)[array[-1]]
    end

    elsif message.join.length % 4 == 1
      message = message.map do |array|
      result = []
      result << cipher(@cipher_d)[array[0]]
      result << cipher(@cipher_a)[array[1]]
      result << cipher(@cipher_b)[array[2]]
      result << cipher(@cipher_c)[array[3]]
    end

    elsif  message.join.length % 4 == 2
      message = message.map do |array|
      result = []
      result << cipher(@cipher_c)[array[0]]
      result << cipher(@cipher_d)[array[1]]
      result << cipher(@cipher_a)[array[2]]
      result << cipher(@cipher_b)[array[3]]
    end

    else
      message = message.map do |array|
      result = []
      result << cipher(@cipher_b)[array[0]]
      result << cipher(@cipher_c)[array[1]]
      result << cipher(@cipher_d)[array[2]]
      result << cipher(@cipher_a)[array[3]]
    end
   end
    message.join
  end


  def crack_key
    while cipher(@cipher_a)[@message[-4]] != "n"
      @cipher_a += 1
    end

    while cipher(@cipher_b)[@message[-3]] != "d"
      @cipher_b += 1
    end

    while cipher(@cipher_c)[@message[-2]] != "."
      @cipher_c += 1
    end

    while cipher(@cipher_d)[@message[-1]] != "."
      @cipher_d += 1
    end
  end
end
