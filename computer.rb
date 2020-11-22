require './logic.rb'

class Computer
  include Logic
  attr_accessor :possible_guesses, :possible_codes, :lives, :best_guess

  def initialize()
    @possible_guesses = [:R, :B, :W, :G, :Y, :P].product([:R, :B, :W, :G, :Y, :P],[:R, :B, :W, :G, :Y, :P],[:R, :B, :W, :G, :Y, :P])
    @possible_codes = [:R, :B, :W, :G, :Y, :P].product([:R, :B, :W, :G, :Y, :P],[:R, :B, :W, :G, :Y, :P],[:R, :B, :W, :G, :Y, :P])
    @lives = 12
    @best_guess = [:R, :R, :B, :B]
    @received_matches = []
  end

  def computer_response(match)
    if !@received_matches.include?(match)
      @received_matches << match
    end

    @possible_codes.select! { |code| match_guess(code, @best_guess) == match }

    @possible_guesses.delete(@best_guess)

    current_guess_score = 0
    @best_guess = @possible_guesses.inject do |current_guess, guess|
      score = calculate_score(guess)
      if score != current_guess_score
        score > current_guess_score ? guess : current_guess
      elsif @possible_codes.include?(current_guess) != @possible_codes.include?(guess)
        @possible_codes.include?(guess) ? guess : current_guess
      else
        current_guess
      end
    end

  end

  def calculate_score(guess)

  end

end
