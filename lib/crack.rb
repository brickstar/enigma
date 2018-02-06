require_relative 'cipher_module.rb'
require 'pry'

message = "8UW&_Va.W\\i&IP`sXhw<I[R<m"
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
    until @message[-4] == "n"
      cipher(@cipher_a += 1)
      cipher_key << cipher(@cipher_a)
    end
    until @message[-3] == "d"
      cipher(@cipher_b += 1)
      cipher_key << cipher(@cipher_b)
    end
    until @message[-2] == "."
      cipher(@cipher_c +=1)
      cipher_key << cipher(@cipher_c)
    end
     until @message[-1] == "."
       cipher(@cipher_d +=1)
       cipher_key << cipher(@cipher_d)
     end
    end
binding.pry
end
