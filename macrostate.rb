require 'die'

class Macrostate
  attr_accessor :value, :microstates, :dice

  def initialize value, *dice
    @value = value
    @dice = dice
    
    first_die = @dice.first
    @microstates = 
      first_die.combinations( *@dice[1..@dice.length] ).reject { |x|
        x.inject(:+) != @value
      }
  end

  def detailed_to_s
    "#{@value} | #{@microstates.length} | #{@microstates.inspect}"
  end

  def to_s
    "#{@value} | #{@microstates.length}"
  end
end
