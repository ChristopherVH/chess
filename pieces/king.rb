class King < SteppingPiece

  def symbol
    @color == :w ? " ♔ ": " ♚ "
  end

end
