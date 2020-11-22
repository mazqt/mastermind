module Logic

  def match_guess(guess, code)
    exact_matches = 0
    close_matches = 0

    guess.each_with_index do |peg, index|
      if guess[index] == code[index]
        exact_matches += 1
      end
    end

    counted_close_matches = []

    guess.each_with_index do |peg_guess, index_guess|
      code.each_with_index do |peg_board, index_board|
         if (peg_guess == peg_board && !(guess[index_board] == code[index_board]))
          if !counted_close_matches.include?(index_board)
            close_matches += 1
            counted_close_matches << index_board
            break
          end
        end
      end
    end

    score = ""

    exact_matches.times { score += "B" }
    close_matches.times { score += "W" }

    return score

  end

end
