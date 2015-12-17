require_relative 'cypher'

input_file = ARGV[0]
output_file = ARGV[1]

message = File.read(input_file).chomp
encrypted = Cypher.new(message).encrypt
File.write(output_file, encrypted)

puts "Created 'encrypted.txt' with the key #{Cypher.new.test_key}
and the date #{Cypher.new.date}"
