require_relative "board"
require_relative "cursor"
require "colorize"
class Display
  attr_reader :board, :cursor

  def initialize(board, cursor)
    @board, @cursor = board, cursor
  end 

  def render
    self.board.grid.each_with_index do |row, row_idx|
      render_row = []
      row.each_with_index do |piece, col|
        if self.cursor.cursor_pos == [row_idx, col]
          if self.cursor.selected 
            render_row << piece.to_s.colorize(:background => :green)
          else  
            render_row << piece.to_s.colorize(:background => :red)
          end 
        elsif (row_idx + col).even?
          render_row << piece.to_s.colorize(:background => :white)
        else 
          render_row << piece.to_s.colorize(:background => :blue)
        end
      end 
      puts render_row.join("")
    end 
  end

  def loop 
    while true
      self.render 
      self.cursor.get_input
      system("clear")
    end 
  end 
end 

