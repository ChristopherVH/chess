require_relative "cursorable"
require 'colorize'

class Display
  include Cursorable

  attr_reader :board, :held_piece

  def initialize(board)
    @board = board
    @cursor_pos = [0, 0]
    @selected = false
    @held_piece = Piece.new(nil) # TODO fix this when we work on pieces
  end

  def show_board
    # TODO do something with board + identifying letters
  end

  def build_grid
    @board.rows.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if [i, j] == @cursor_pos
      bg = :green
    elsif (i + j).odd?
      bg = :yellow
    else
      bg = :orange
    end
    { background: bg, color: :white }
  end

  def selected_piece
    result = nil
    until result
      render
      result = get_input
    end
  end

  def key_hit
    result = nil
    until result
      @display.render
      result = @display.get_input
    end
    result
  end

  def select_piece
    if @selected # we are holding a piece
      puts "move the piece"
      @selected = false
      drop_piece(key_hit) unless (piece)valid_move?(key_hit)
    else # we are not holding a piece
      puts "take a piece"
      @selected = true
      grab_piece(key_hit)
      select_piece
    end
  end

  def grab_piece(pos)
    @held_piece = @board[pos]
  end

  def drop_piece(pos)
  end


  def render
    system("clear")
    puts "Chess!"
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    build_grid.each { |row| puts row.join }
  end
end
