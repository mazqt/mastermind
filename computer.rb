require './logic.rb'
require 'byebug'

class Computer
  include Logic
  attr_accessor :possible_guesses, :possible_codes, :lives, :best_guess
  @@possible_matches = ["B", "BB", "BBB", "BBBB", "BW", "BBW", "BWW", "BBWW", "BWWW", "WWWW", "WWW", "WW", "W"]

  def initialize()
    @possible_guesses = [:R, :B, :W, :G, :Y, :P].product([:R, :B, :W, :G, :Y, :P],[:R, :B, :W, :G, :Y, :P],[:R, :B, :W, :G, :Y, :P])
    @possible_codes = [:R, :B, :W, :G, :Y, :P].product([:R, :B, :W, :G, :Y, :P],[:R, :B, :W, :G, :Y, :P],[:R, :B, :W, :G, :Y, :P])
    @lives = 12
    @best_guess = [:R, :R, :B, :B]
  end

  def computer_response(match)
    codes_passed = []

    @possible_codes.each do |code|
      result = match_guess(code, @best_guess)
      codes_passed << code if result == match
    end

    @possible_codes = codes_passed

    @possible_guesses.delete(@best_guess)


    debugger
    current_guess_score = 0
    @best_guess = @possible_guesses.inject do |current_guess, guess|
      score = calculate_score(guess)
      if score != current_guess_score
        if score > current_guess_score
          current_guess_score = score
          guess
        else
          current_guess
        end
      elsif @possible_codes.include?(current_guess) != @possible_codes.include?(guess)
        if @possible_codes.include?(guess)
          current_guess_score = score
          guess
        else
          current_guess
        end
      else
        current_guess
      end
    end

  end

  def calculate_score(current_guess)
    hit_count = Hash.new(0)
    @possible_codes.each do |code|
      match = match_guess(current_guess, code)
      hit_count[match] += 1
    end
    hit_count = hit_count.sort_by { |match, count| count }
    score = @possible_codes.length - hit_count[-1][-1]
    return score
  end

end
