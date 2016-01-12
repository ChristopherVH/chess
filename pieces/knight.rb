require_relative 'steppingpiece.rb'


class Knight < SteppingPiece

  def symbol
    @color == :w ? " ♘ ": " ♞ "
  end

end
