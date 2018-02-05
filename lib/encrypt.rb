require './lib/date'
require './lib/cipher_module.rb'

class Encrypt
  include Cipher

  attr_reader :message

  def initialize(message, key = "56710", date)
    @message = message
    @key  = key
    @date = date
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
end
