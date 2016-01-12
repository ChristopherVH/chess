require_relative "pieces.rb"


class Pawn < Piece

  def symbol
    @color == :w ? " ♙ ": " ♟	"
  end

end
