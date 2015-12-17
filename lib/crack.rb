class Crack

  def initialize(message, key = 41521, date = 131215)
    @message = message
    @key = key
    @date = date
  end

  def place_value
    input = @message.split(//)
    characters = [*'a'..'z',*'0'..'9',' ','.',',']
    inputs = input.map do |i|
      characters.index(i)
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
