require 'pry'

class Junk
  def initialize(rotation)
    @rotation = rotation
  end

  def cipher(rotation = @rotation)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    new_hash = Hash[characters.zip(rotated_characters)]
  end
  binding.pry
end
