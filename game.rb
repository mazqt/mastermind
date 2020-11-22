require './logic.rb'

class Game
  include Logic

  def initialize
    @board = Board.new()
    @player = Player.new()
  end

  def play()
    puts "Let's take a crack at the code!"

    while @player.lives > 0

      guess = @player.make_guess()

      matches = match_guess(guess, @board.code)
      matches = matches.split("")

      exact_matches = matches.count { |peg| peg == "B" }
      close_matches = matches.count { |peg| peg == "W" }

      puts "You had #{exact_matches} exact matches and #{close_matches} close matches"

      if @board.win?(guess)
        puts "Congratulations! You cracked the code with #{@player.lives - 1} tries left!"
        return
      end

      @player.lives -= 1
    end
    puts "You ran out of lives! Better luck next time!"
  end

end
