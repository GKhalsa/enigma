class Decrypt

  def initialize(message, key = 41521, date = 131215)
    @message = message
    @key = key
    @date = date
  end

  def todays_date # =>
    date = @date
    date.to_i# =>
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
    rotation = @key.to_s
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
    rotation = @key.to_s
    rotation_b = rotation[1..2]
    rotation_b = rotation_b.to_i
    offset_b = last_four.to_s
    offset_b = offset_b[1]
    offset_b = offset_b.to_i
    full_rotation_b = rotation_b + offset_b
  end

  def full_rotation_c
    rotation = @key.to_s
    rotation_c = rotation[2..3]
    rotation_c = rotation_c.to_i
    offset_c = last_four.to_s
    offset_c = offset_c[2]
    offset_c = offset_c.to_i
    full_rotation_c = rotation_c + offset_c
  end

  def full_rotation_d
    rotation = @key.to_s
    rotation_d = rotation[3..4]
    rotation_d = rotation_d.to_i
    offset_d = last_four.to_s
    offset_d = offset_d[3]
    offset_d = offset_d.to_i
    full_rotation_d = rotation_d + offset_d
  end

  def place_value
    input = @message.split(//)
    characters = [*'a'..'z',*'0'..'9',' ','.',',']
    inputs = input.map do |i|
      characters.index(i) # =>
    end
  end

  def rotations
  a = full_rotation_a
  b = full_rotation_b
  c = full_rotation_c
  d = full_rotation_d
  rotations = [a,b,c,d] # =>
  end

  def decrypt
    array = place_value
    rotation = rotations
    characters = [*'a'..'z',*'0'..'9',' ','.',',']
    array.map.with_index do |num, index|
      a = characters.rotate num
      b = a.rotate! -rotation[index %4]
      b[0]
    end
  end


end
