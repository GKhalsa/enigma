require_relative 'cypher'

input_file = ARGV[0]
output_file = ARGV[1]


encrypted = File.read(input_file).chomp
decryptedd = Cypher.new(encrypted).decrypt
File.write(output_file, decryptedd)

puts "Created 'decrypted.txt' with the key #{Cypher.new.test_key}
and the date #{Cypher.new.date}"
