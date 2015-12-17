require 'minitest/autorun'
require 'pry'
require_relative './../lib/crack'

class DecryptTest < Minitest::Test

  def test_last_four_values_for_crack
    message = Crack.new("ww6h3nt7t5y7n")
    assert_equal [31,24,33,13], message.last_four_uncracked_values
  end

  def test_last_four_minus_crack_key
    message = Crack.new("ww6h3nt7t5y7n")
    assert_equal [18,21,-4,-24], message.last_four_minus_crack_four
  end

  def test_reverse_values_of_four_minus_crack_four
    message = Crack.new("ww6h3nt7t5y7n")
    assert_equal [-18,-21,4,24], message.value_reversal
  end

  def test_absolute_value_for_crack
    message = Crack.new("7t5y7n")
    assert_equal [37,37,3,13,4, 37], message.reversed_absolute_values
  end

  def test_cracking_the_message
    message = Crack.new("ww6h3nt7t5y7n")
    assert_equal ["h", "e", "l", "l", "o", "8", ".", ".", "e", "n", "d", ".", "."], message.crack
  end

end
