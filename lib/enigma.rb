require 'pry'
require './lib/encrypt.rb'
require './lib/decrypt.rb'

class Enigma
  attr_reader :message

  def initialize(message)
    @message = message
  end
end
