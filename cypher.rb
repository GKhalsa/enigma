require 'pry'

class Cypher
  # attr_reader :day, :month, :year  # => nil

  def initialize
    time = Time.new
    @date = time.strftime("%d%m%y")
  end

  def todays_date
    date = @date
    date.to_i
  end

  def squared
    date = @date
     date.to_i ** 2
  end



git hub test

end
