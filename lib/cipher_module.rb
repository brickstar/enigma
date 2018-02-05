module Cipher

  def cipher(rotation)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    new_hash = Hash[characters.zip(rotated_characters)]
  end

  def split_message(my_message)
    message = my_message.chars.each_slice(4)
    message.map(&:join)
  end

end
