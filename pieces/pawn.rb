class Pawn < Piece

  def symbol
    @color == :w ? " ♙ ": " ♟	"
  end

end
