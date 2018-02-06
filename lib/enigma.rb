require 'pry'
require './lib/encrypt.rb'
require './lib/decrypt.rb'

class Enigma
  attr_reader :message

  def initialize(message)
    @message = message
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

end
