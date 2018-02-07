require './lib/key_generator'
require './lib/enigma'
require './lib/date'

handle = File.open(ARGV[0],"r")
key = KeyGenerator.new
random_key = key.random_key
key.find_key
offset = offset_calculator
binding.pry
enigma = Enigma.new(handle, key, date)

encrypted_text = File.open(ARGV[1], "w")

encrypted_text.write(ARGV[1])

puts %Q(created #{ARGV[1]} with the key #{enigma.key} and date #{enigma.date})
