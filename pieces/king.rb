require_relative "steppingpiece.rb"


class King < SteppingPiece

  def symbol
    @color == :w ?  " ♚ " : " ♔ "
  end

end
