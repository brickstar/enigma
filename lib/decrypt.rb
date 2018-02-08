require './lib/cipher_module'
require './lib/key_generator'
require './lib/enigma'
require './lib/date'

handle = File.open(ARGV[0], "r")
incoming_text = handle.read

date = Date.new
enigma = Enigma.new(incoming_text, date.find_today)
enigma.crack_key
split_message = enigma.split_message(incoming_text)
decrypted_text = File.open(ARGV[1], "w")
decrypted_text.write(enigma.decrypt(split_message))
decrypted_text.close

puts "Created #{ARGV[1]} with date offset #{enigma.date}"
