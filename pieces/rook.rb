require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
  SCORE = 5

  include Slideable

  def symbol
    '♜'.colorize(color)
  end

  protected

  def move_dirs
    horizontal_dirs
  end
end
