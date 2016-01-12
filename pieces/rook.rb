require_relative 'horizontal_movement_module'
require_relative 'slidingpiece.rb'

class Rook < SlidingPiece
  include HorizontalMovementModule

  def symbol
    @color == :w ?  " ♜ " : " ♖ "
  end

end
