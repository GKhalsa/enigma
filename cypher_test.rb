require 'minitest/autorun'  # => true
require_relative 'cypher'   # ~> ArgumentError: wrong number of arguments (0 for 1)
require 'pry'

class CypherTest < Minitest::Test
  def setup
    @cypher = Cypher.new           # => #<Cypher:0x007fd08506c810 @date="131215", @test_key=41521, @input="">, #<Cypher:0x007fd085057e38 @date="131215", @test_key=41521, @input="">, #<Cypher:0x007fd085846a90 @date="131215", @test_key=41521, @input="">, #<Cypher:0x007fd085845e10 @date="131215", @test_key=41521, @input="">, #<Cypher:0x007fd085844e48 @date="131215", @test_key=41521, @input="">, #<Cypher:0x007fd0858376f8 @date="131215", @test_key=41521, @input="">, #<Cypher:0x007fd08418f680 @date="131215", @test_key=41521, @input="">, #<Cypher:0x007fd08418ec58 @date="131215", @test_key=41521, @input="">, #<Cypher:0x007fd08418d4e8 @date="131215", @test_key=41521, @input="">, #<Cypher:0x007fd08418cd40 @date="131215", @test_key=41521, @input="">, #<Cypher:0x007fd08418e708 @date="131215", @test_key=41521, @input="">, #<Cypher:0x007fd08416ff60 @date="131215", @test_key=41521, @input="">, #<Cypher:0x007fd08514c2d0 @date="131215", @test_key=41521, @input="">, #<Cypher:0x007fd08513e6f8 @date="131215", @test_key=41521, @input="">
  end

  def test_take_the_date
    assert_equal 131215, @cypher.todays_date  # => true
  end

  def test_square_the_date
    assert_equal 17217376225 , @cypher.squared  # => true
  end

  def test_get_last_four_numbers_from_squaredate
    assert_equal 6225, @cypher.last_four          # => true
  end

  def test_sample_key
    assert_equal 41521, @cypher.test_key  # => true
  end

  def test_encryption_for_rotation_a
    assert_equal 41, @cypher.rotation_a  # => true
  end

  def test_encryption_for_offset_a
    assert_equal 6, @cypher.offset_a  # => true
  end

  def test_encryption_for_rotation_plus_offset_a
    assert_equal 47, @cypher.full_rotation_a      # => true
  end

  def test_encryption_for_rotation_plus_offset_b
    assert_equal 17, @cypher.full_rotation_b      # => true
  end

  def test_encryption_for_rotation_plus_offset_c
    assert_equal 54, @cypher.full_rotation_c      # => true
  end

  def test_encryption_for_rotation_plus_offset_d
    assert_equal 26, @cypher.full_rotation_d      # => true
  end

  def test_find_place_value_of_letter
    z = Cypher.new("z")
    assert_equal [25], z.place_value
  end

  def test_find_place_value_of_symbol
    period = Cypher.new(".")
    assert_equal [37], period.place_value
  end

  def test_find_place_value_of_space

    space = Cypher.new(" ")
    assert_equal [36], space.place_value
  end

  def test_find_value_of_two_characters
    characters = Cypher.new("ab")
    assert_equal [0,1], characters.place_value
  end

  def test_find_value_of_two_characters_and_space
    characters = Cypher.new("ab ")
    assert_equal [0,1,36], characters.place_value
  end

  def test_value_of_full_rotation_and_letter_place_a
    message = Cypher.new("a")
    assert_equal 47, message.full_value_a
  end

  def test_value_of_full_rotation_and_letter_place_b
    message = Cypher.new("ab")
    assert_equal 18, message.full_value_b
  end

  def test_value_of_full_rotation_and_letter_place_c
    message = Cypher.new("abc")
    assert_equal 56, message.full_value_c
  end

  def test_value_of_full_rotation_and_letter_place_d
    message = Cypher.new("abc.")
    assert_equal 63, message.full_value_d
  end

  def test_convert_method
    message = Cypher.new("hello")
    assert_equal [15,21,26,37,22], message.convert
  end

  def test_converted_array_to_encrypt
    message = Cypher.new("hello")
    assert_equal ["p","v","0",".","w"], message.encrypt
  end

  def test_encrypt_longer_message
    message = Cypher.new("hello my friend")
    assert_equal ["p", "v", "0", ".", "w", "o", "1", "l", "f", "w", "6", "8", "m", "4", "s"], message.encrypt
  end

  def test_decrypt_one_letter
    message = Cypher.new("p")
    assert_equal ["h"], message.decrypt
  end

  def test_decrypt_two_letters
    message = Cypher.new("pv")
    assert_equal ["h","e"], message.decrypt
  end

  def test_decrypt_message
    message = Cypher.new("pv0.wo1lfw68m4s")
    assert_equal ["h","e","l","l","o"," ","m","y"," ","f","r","i","e","n","d"], message.decrypt
  end
end
