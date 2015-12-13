require 'minitest/autorun'
require_relative 'cypher'
require 'pry'

class CypherTest < Minitest::Test
  def test_take_the_date
    date = Cypher.new
    assert_equal 131215, date.todays_date
  end

  def test_square_the_date
    date = Cypher.new
    assert_equal 17217376225 , date.squared
  end

  def test_get_last_four_numbers_from_squaredate
    date = Cypher.new

    git hub test






end
