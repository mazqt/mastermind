class Board
  attr_reader :code
  @@peg_colours = [:R, :B, :W, :G, :Y, :P]

  def initialize()
    @code = []
    4.times { @code << @@peg_colours.sample }
  end

  def win?(guess)
    return true if guess == @code
    false
  end

end
