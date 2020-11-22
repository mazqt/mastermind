
class Game
  def initialize
    @board = Board.new()
    @player = Player.new()
  end

  def play()
    puts "Let's take a crack at the code!"

    while @player.lives > 0

      guess = @player.make_guess()

      @board.match_guess(guess)

      if @board.win?(guess)
        puts "Congratulations! You cracked the code with #{@player.lives - 1} tries left!"
        return
      end

      @player.lives -= 1
    end
    puts "You ran out of lives! Better luck next time!"
  end

end
