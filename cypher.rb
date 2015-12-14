require 'pry'  # => true


class Cypher
  attr_reader :test_key  # => nil
  #attr_accessor :input

  def initialize(input="")
    time = Time.new                  # => 2015-12-13 21:41:18 -0700
    @date = time.strftime("%d%m%y")  # => "131215"
    @test_key = 41521                # => 41521
    @input = input                   # => "ab"
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

    input = @input.split(//)                                                                                                                                                    # => ["a", "b"]
    characters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9"," ",".",","]  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    inputs = input.map do |i|                                                                                                                                                   # => ["a", "b"]
      characters.index(i)                                                                                                                                                       # => 0, 1
    end                                                                                                                                                                         # => [0, 1]


  end




end

    #  tes = Cypher.new("ab").place_value  # => [0, 1]
