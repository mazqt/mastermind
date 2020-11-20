class Board
  @@peg_colours = [:R, :B, :W, :G, :Y, :P]

  def initialize()
    @board = []
    4.times { @board << @@peg_colours.sample }
  end

  def match_guess(guess)
    exact_matches = 0
    close_matches = 0

    guess.each_with_index do |peg, index|
      if guess[index] == @board[index]
        exact_matches += 1
      end
    end

    counted_close_matches = []

    guess.each_with_index do |peg_guess, index_guess|
      @board.each_with_index do |peg_board, index_board|
         if (peg_guess == peg_board && !(guess[index_board] == @board[index_board]))
          if !counted_close_matches.include?(index_board)
            close_matches += 1
            counted_close_matches << index_board
            break
          end
        end
      end
    end

    puts "You had #{exact_matches} exact matches and #{close_matches} close matches"
  end

end
