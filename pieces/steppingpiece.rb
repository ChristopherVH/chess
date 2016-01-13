require_relative 'pieces'


class SteppingPiece < Piece

  def step
    step_array = []
    move_hash = potential_moves
    move_hash.each do |key, value|
      if value.in_bounds?
        if board[value].color.nil?
          step_array << value # if passes tests
          move_hash[key] = [value.first + key.first, value.last + key.last]
        else
          step_array << value unless board[value].color == self.color
        end
      end
    end
    step_array
  end

  def get_valid_moves
    @valid_moves = step
  end

end
