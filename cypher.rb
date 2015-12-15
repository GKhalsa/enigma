require 'pry'  # => true


class Cypher
  attr_reader :test_key  # => nil
  #attr_accessor :input

  def initialize(input="")
    time = Time.new         # => 2015-12-14 20:24:21 -0700
    @date = 131215 #time.strftime("%d%m%y")
    @test_key = 41521       # => 41521
    @input = input          # => "A"
  end

  def todays_date
    date = @date
    date.to_i
  end

  def squared
    date = @date
    date.to_i ** 2
  end

  def last_four
    square_string = squared.to_s
    square_split = square_string.split(//)
    slice_four = square_split.slice(-4..-1)
    slice_four.join.to_i
  end

  def rotation_a
    rotation = @test_key.to_s
    rotation_a = rotation[0..1]
    rotation_a = rotation_a.to_i
  end

  def offset_a
    offset = last_four.to_s
    offset_a = offset[0]
    offset_a = offset_a.to_i
  end

  def full_rotation_a
    rotation_a + offset_a
  end

  def full_rotation_b
    rotation = @test_key.to_s
    rotation_b = rotation[1..2]
    rotation_b = rotation_b.to_i
    offset_b = last_four.to_s
    offset_b = offset_b[1]
    offset_b = offset_b.to_i
    full_rotation_b = rotation_b + offset_b
  end

  def full_rotation_c
    rotation = @test_key.to_s
    rotation_c = rotation[2..3]
    rotation_c = rotation_c.to_i
    offset_c = last_four.to_s
    offset_c = offset_c[2]
    offset_c = offset_c.to_i
    full_rotation_c = rotation_c + offset_c
  end

  def full_rotation_d
    rotation = @test_key.to_s
    rotation_d = rotation[3..4]
    rotation_d = rotation_d.to_i
    offset_d = last_four.to_s
    offset_d = offset_d[3]
    offset_d = offset_d.to_i
    full_rotation_d = rotation_d + offset_d
  end

  def place_value

    input = @input.split(//)                        # => ["A"]
    characters = [*'a'..'z',*'0'..'9',' ','.',',']  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    inputs = input.map do |i|                       # => ["A"]
      characters.index(i)                           # => nil
    end                                             # => [nil]
  end

  def full_value_a
    value_for_a = full_rotation_a + place_value[0]
  end


  def full_value_b
    value_for_b = full_rotation_b + place_value[1]
  end

  def full_value_c
    value_for_c = full_rotation_c + place_value[2]
  end

  def full_value_d
    value_for_d = full_rotation_d + place_value[3]
  end

  def rotations
  a = full_rotation_a
  b = full_rotation_b
  c = full_rotation_c
  d = full_rotation_d
  rotations = [a,b,c,d]
  end

  def convert
    rotations = Cypher.new.rotations
    array = place_value
    #array = [7,4,11,11,14]
    #rotations = [47, 17, 54, 26]
    array.map.with_index do |num, index|
      (num + rotations[index % 4]) % 39
    end
  end

  def encrypt
    converted = convert
    characters = [*'a'..'z',*'0'..'9',' ','.',',']
    converted.map do |num|
      characters[num]
    end
  end

  def decrypt
    array = place_value
    rotations = Cypher.new.rotations
    characters = [*'a'..'z',*'0'..'9',' ','.',',']
    array.map.with_index do |num, index|
      a = characters.rotate num
      b = a.rotate! -rotations[index %4]
      b[0]
    end
  end






  #test = Cypher.new("A").place_value # => [nil]

end

    # tes = Cypher.new("hellohello").place_value  # => [7, 4, 11, 11, 14, 36, 36, 36, 7, 4, 11, 11, 14]

# array = [7,4,11,11,36]
# convert(array)
# # new_array = [54, 21, 65, 37, 83]
#
# def convert(original_array)
#   rotations = [47, 17, 54, 26]
#   r_count = 4
#   #counter = 0
# .each_with_index
# .map
# .map_with_index
# .with_index
# .map.with_index
# .each.with_index
#
#   original_array.map.with_index do |num, index|
#     (num + rotations[index % 4]) % 39
#   end
#
#
# end
#
#
# final value map => [54, 21, 65, 37, ]
