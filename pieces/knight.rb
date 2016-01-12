class Knight < SteppingPiece

  def symbol
    @color == :w ? " ♘ ": " ♞ "
  end

end
