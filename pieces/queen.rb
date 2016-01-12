require_relative 'diagonal_movement_module'
require_relative 'horizontal_movement_module'

require_relative 'slidingpiece.rb'


class Queen < SlidingPiece
  include HorizontalMovementModule
  include DiagonalMovementModule

    def symbol
      @color == :w ?  " ♛ " : " ♕ "
    end

end
