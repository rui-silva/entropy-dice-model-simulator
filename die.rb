class Die
  attr_accessor :numbers

  def initialize sides=6
    @numbers = [* 1..sides]
  end

  def combinations *dice
    dice.map! {|d| d.numbers}
    @numbers.product *dice
  end

  def sides
    @numbers.length
  end
end
