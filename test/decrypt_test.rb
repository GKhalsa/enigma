require 'minitest/autorun'
require 'pry'
require_relative './../lib/decrypt'

class DecryptTest < Minitest::Test

  def test_decrypt_one_letter
    message = Decrypt.new("p")
    assert_equal ["h"], message.decrypt
  end

  def test_decrypt_two_letters
    message = Decrypt.new("pv")
    assert_equal ["h","e"], message.decrypt
  end

  def test_decrypt_message
    message = Decrypt.new("pv0.wo1lfw68m4s")
    assert_equal ["h","e","l","l","o"," ","m","y"," ","f","r","i","e","n","d"], message.decrypt
  end



end
