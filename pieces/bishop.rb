require 'diagonal_movement_module'

class Bishop < SlidingPiece
  include DiagonalMovementModule

  def symbol
    @color == :w ? " ♗ ": " ♝ "
  end
end
