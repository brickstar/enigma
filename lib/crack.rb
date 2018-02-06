require_relative 'cipher_module.rb'
require 'pry'

class Crack
  include Cipher

  def initialize(message)
    @message = message
    @cipher_a = 7
    @cipher_b = 5
    @cipher_c = 2
    @cipher_d = 4
  end

  def crack_key
    cipher_key = []
    while cipher(@cipher_a)[@message[-4]] != "n"
      @cipher_a += 1
    end
    cipher_key << @cipher_a
    cipher_key
  #     cipher_key << cipher(@cipher_a)
  #   until @message[-3] == "d"
  #     cipher(@cipher_b += 1)
  #   end
  #     cipher_key << cipher(@cipher_b)
  #   until @message[-2] == "."
  #     cipher(@cipher_c +=1)
  #   end
  #     cipher_key << cipher(@cipher_c)
  #    until @message[-1] == "."
  #      cipher(@cipher_d +=1)
  #    end
  #     cipher_key << cipher(@cipher_d)
  end
end
