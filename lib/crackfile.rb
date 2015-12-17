require_relative 'cypher'

input_file = ARGV[0]
output_file = ARGV[1]

encrypted = File.read(input_file).chomp
cracked = Cypher.new(encrypted).crack
File.write(output_file, cracked)

puts "Yo shit got cracked son"
