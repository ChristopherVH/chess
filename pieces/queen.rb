require 'diagonal_movement_module'
require 'horizontal_movement_module'

class Queen < SlidingPiece
  include HorizontalMovementModule
  include DiagonalMovementModule
end
