require 'pry'
require './lib/encrypt.rb'
require './lib/decrypt.rb'
require './lib/cipher_module.rb'

class Enigma
  include Cipher
  attr_reader :message

  def initialize(message, key = "56710", date = "7524")
    @message = message
    @key     = key
    @date    = date
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

  def decrypt(message = @message)
    message = message.map do |array|
    result = []
    result << cipher(19)[@message[-4]]
    result << cipher(18)[@message[-3]]
    result << cipher(77)[@message[-2]]
    result << cipher(28)[@message[-1]]
    end
    message.join
   end
end
