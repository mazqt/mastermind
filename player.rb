class Player
  @@peg_colours = [:R, :B, :W, :G, :Y, :P]
  def initialize()
    @lives = 12
  end

  def make_guess()
    puts "Guess the code!"
    puts "Reminder: Available pegs are R, B, W, G, Y, and P"
    guess = gets.chomp.split

    while guess.any? { |peg| peg.length != 1 || !(@@peg_colours.include?(peg.upcase.to_sym)) } || guess.length != 4
      if guess.length != 4
        puts "Too many pegs! Re-enter your guess"
      elsif guess.any? { |peg| peg.length != 1 }
        puts "Each peg is only one letter. Like this. R B G P"
      else
        puts "Only R, B, W, G, Y, and P are legal choices! Re-enter your guess"
      end
      guess = gets.chomp.split
    end

    guess.map! { |peg| peg.upcase.to_sym }
    return guess
  end

end
