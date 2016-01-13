require_relative "pieces.rb"


class Pawn < Piece

  def symbol
    @color == :w ?  " ♟ " : " ♙ "
  end

  def direction
    color == :w ? 1 :  -1
  end

  def forward_step # return the forward step
    [pos.first, pos.last + direction]
  end

  def first_step
    [pos.first, pos.last + 2 * direction]
  end

  def side_steps
    [[forward_step.first + 1 , forward_step.last] , [forward_step.first - 1 , forward_step.last]]
  end

  def pawning
    pawn_array = []
    pawn_array << forward_step if board[forward_step].color.nil?
    side_steps.each { |step| pawn_array << step if board[step].color != color }
    if color == :w && pos.last == 1 || color == :b && pos.last == 6
      pawn_array << first_step if board[first_step].color.nil?
    end
  end

  def get_valid_moves
    @valid_moves = pawning
  end
end
