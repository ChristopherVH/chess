require_relative 'minimax_node'
require_relative 'player'

class ComputerPlayer < Player

  def make_move(board)
    MinimaxNode.set_successor_function(next_available_moves)
    MinimaxNode.set_evaluation_function(checkmate_or_value_of_pieces)
    MinimaxNode.set_termination_test(game_over)

    initial_state = {
      current_color: color,
      board: board
    }

    MinimaxNode.new(initial_state).minimax(2) # look 2 moves ahead
  end

  private

  def next_available_moves
    lambda do |state|
      board = state[:board]
      current_color = state[:current_color]
      current_color_pieces = pieces_of_color(board, current_color)

      current_color_pieces.inject([]) do |available_moves, piece|
        new_moves = available_moves_for_piece(piece, board, current_color)
        available_moves.concat(new_moves)
      end
    end
  end

  def available_moves_for_piece(piece, board, current_color)
    piece.valid_moves.map do |valid_move|
      minimax_node_for_move(piece, board, current_color, valid_move)
    end
  end

  def minimax_node_for_move(piece, board, current_color, valid_move)
    from_pos, to_pos = [piece.pos, valid_move]
    new_board = board.dup

    new_board.move_piece!(from_pos, to_pos)
    new_current_color = other_color(current_color)

    new_state = {
      current_color: new_current_color,
      board: new_board
    }

    MinimaxNode.new(new_state, [from_pos, to_pos])
  end

  def checkmate_or_value_of_pieces
    lambda do |state|
      board = state[:board]

      return Float::INFINITY if opponent_in_checkmate?(board)
      return Float::INFINITY * -1 if i_am_in_checkmate?(board)

      value_of_my_pieces(board) - value_of_opponent_pieces(board)
    end
  end


  def game_over
    lambda do |state|
      board = state[:board]
      board.checkmate?(:white) || board.checkmate?(:black)
    end
  end

  def value_of_my_pieces(board)
    my_pieces(board).inject(0) do |score_sum, piece|
      score_sum += piece.class::SCORE
    end
  end

  def value_of_opponent_pieces(board)
    opponent_pieces(board).inject(0) do |score_sum, piece|
      score_sum += piece.class::SCORE
    end
  end

  def my_pieces(board)
    pieces_of_color(board, color)
  end

  def opponent_pieces(board)
    pieces_of_color(board, other_color(color))
  end

  def pieces_of_color(board, color_to_check)
    board.pieces.select { |p| p.color == color_to_check }
  end

  def other_color(color_to_check)
    color_to_check == :white ? :black : :white
  end

  def opponent_in_checkmate?(board)
    board.checkmate?(other_color(color))
  end

  def i_am_in_checkmate?(board)
    board.checkmate?(color)
  end

end
