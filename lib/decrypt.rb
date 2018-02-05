require './lib/cipher_module.rb'
class Decrypt
  include Cipher

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
