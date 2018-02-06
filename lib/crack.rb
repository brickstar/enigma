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

    while cipher(@cipher_b)[@message[-3]] != "d"
      @cipher_b += 1
    end
    cipher_key << @cipher_b

    while cipher(@cipher_c)[@message[-2]] != "."
      @cipher_c += 1
    end
    cipher_key << @cipher_c

    while cipher(@cipher_d)[@message[-1]] != "."
      @cipher_d += 1
    end
    cipher_key << @cipher_d
  end
end
