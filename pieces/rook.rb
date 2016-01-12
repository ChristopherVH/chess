require 'horizontal_movement_module'

class Rook < SlidingPiece
  include HorizontalMovementModule

  def symbol
    @color == :w ? " ♖ ": " ♜	"
  end

end
