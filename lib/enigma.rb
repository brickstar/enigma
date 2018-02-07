require 'pry'
require './lib/encrypt.rb'
require './lib/decrypt.rb'
require './lib/cipher_module.rb'
require './lib/key_generator.rb'

class Enigma
  include Cipher
  attr_reader :message

  def initialize(message, key = "56710", date = 7524)
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
    result << cipher(63)[array[0]]
    result << cipher(72)[array[1]]
    result << cipher(73)[array[2]]
    result << cipher(14)[array[3]]
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
#Just add a key initalize with a random key
# key = KeyGenerator.new
# key.random_key
# calculator = key.offset_calculator
# message = message.map do |array|
# result = []
# result << cipher(calculator[0..1])[array[0]]
# result << cipher(calculator[1..2])[array[1]]
# result << cipher(calculator[2..3])[array[2]]
# result << cipher(calculator[3..4])[array[3]]
