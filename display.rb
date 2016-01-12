require_relative "cursorable"
require "./pieces/pieces.rb"
require_relative "board.rb"
require 'colorize'

class Display
  include Cursorable

  attr_reader :board 
  attr_accessor :message, :held_piece

  def initialize
    @board = Board.new
    @cursor_pos = [0, 0]
    @message = ''
    @held_piece = nil # TODO fix this when we work on pieces
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
      bg = :light_blue
    end
    { background: bg, color: :white }
  end

  def key_hit
    result = nil
    until result
      render
      result = get_input
    end
    result
  end

  def select_piece
    if @held_piece # we are holding a piece
      puts "move the piece"
      drop_piece(key_hit)
      @held_piece = nil
    else # we are not holding a piece
      puts "take a piece"
      grab_piece(key_hit)
      select_piece
    end
  rescue #InvalidMoveError
      @held_piece = nil
      select_piece
  end

  def grab_piece(pos) # color
    if @board[pos].color == @player_color # TODO define @player_color
      @held_piece = @board[pos]
    else
      raise "You don't own that piece :("
      #TODO raise invalid move error
    end
  end

  def drop_piece(pos)
    if @held_piece.valid_moves.include?(pos)
      dup = board.dup
      board.dup.move!
      board.move
      board.move(@held_piece.pos, pos)
    else
      raise "You can't move there!! :("
      #TODO raise invalid move error
    end

  end


  def render
    system("clear")
    puts "Chess!"
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    build_grid.each { |row| puts row.join }
  end

  def game_test
    puts "play chess!"
    while true
      render
      pos = key_hit
    end
  end

end
