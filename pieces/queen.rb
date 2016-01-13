require_relative 'diagonal_movement_module'
require_relative 'horizontal_movement_module'
require_relative 'slidingpiece.rb'

class Queen < SlidingPiece
  include DiagonalMovementModule
  include HorizontalMovementModule

  def symbol
    @color == :w ?  " ♛ " : " ♕ "
  end

  def directions
    horizontal.concat(diagonal)
  end

end
