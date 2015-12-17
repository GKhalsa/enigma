require 'pry'

class Cypher
  attr_reader :test_key

  def initialize(input="")
    time = Time.new
    @date = 131215 #time.strftime("%d%m%y")
    @test_key = 41521
    @input = input
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

    input = @input.split(//)
    characters = [*'a'..'z',*'0'..'9',' ','.',',']
    inputs = input.map do |i|
      characters.index(i)
    end
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

  def last_four_uncracked_values
    a = place_value
    a[-4..-1]
  end

  def last_four_minus_crack_four
    a = last_four_uncracked_values
    crack_four = [13,3,37,37]
    [a[0] - crack_four[0], a[1] - crack_four[1],
    a[2] - crack_four[2], a[3] - crack_four[3] ]
  end

  def value_reversal
    a = last_four_minus_crack_four
    a.map do |num|
      if num > 0
        num = -num
      elsif num < 0
        num = num.abs
      else
        num = num
      end
    end
  end

  def reversed_absolute_values
    a = place_value.reverse
    b = value_reversal.reverse
    a.map.with_index do |num, index|
      (num + b[index %4]) % 39
    end
  end

  def crack
    a = reversed_absolute_values.reverse
    characters = [*'a'..'z',*'0'..'9',' ','.',',']
    a.map do |num|
      characters[num]
    end
  end

end  
