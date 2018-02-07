require './lib/cipher_module.rb'
require './lib/key_generator.rb'
require './lib/enigma.rb'

handle = File.open(ARGV[0],"r")
incoming_text = handle.read
key_instance = KeyGenerator.new
random_key = key_instance.random_key
find_key = key_instance.find_key
key = key_instance.offset_calculator(find_key)
date = Date.new
enigma = Enigma.new(incoming_text, key, date.find_today)
split_message = enigma.split_message(incoming_text)

encrypted_text = File.open(ARGV[1], "w")

encrypted_text.write(enigma.encrypt(split_message))
encrypted_text.close

puts "Created #{ARGV[1]} with the key #{enigma.key} and date #{enigma.date}"
