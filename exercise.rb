require 'die'
require 'macrostate'

class Exercise

  def run
    puts "How many dice?"
    dice_number = gets.chomp.to_i

    dice = []
    (1..dice_number).each { |i|
      puts "Number of sides of the die?"
      n = gets.chomp.to_i
      dice << Die.new( n )
    }

    min_macrostate = dice.length
    max_macrostate = dice.inject(0){ |sum, x| sum + x.sides }

    puts "Macrostate | Number of Microstates"
    (min_macrostate..max_macrostate).each { |i|
      macrostate = Macrostate.new i, *dice
      puts macrostate.to_s
    }
    
  end
end

if __FILE__ == $PROGRAM_NAME
  ex = Exercise.new
  ex.run
end
