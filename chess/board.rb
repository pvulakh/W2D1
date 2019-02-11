
class Board 
  attr_reader :grid 
  
  def initialize  
    @grid = Array.new(8) { [] }
    #call method that populates grid with pieces + nullpieces
    #if idx <= 1, shovel x pieces 
    #shovel piece type by row idx
    populate_grid
  end
  
  def populate_grid 
    grid.each.with_index do |row, idx|
      if [0,1].include?(idx)
        (0..7).each {|col_idx| row[col_idx] = Piece.new(:black, self, [idx, col_idx])}
      elsif [6,7].include?(idx)
        (0..7).each {|col_idx| row[col_idx] = Piece.new(:white, self, [idx, col_idx])}
      else  
        8.times { row << NullPiece.new }
      end
    end 
  end 

  def move_piece(start_pos, end_pos)
    raise InvalidPosError unless valid_pos?(end_pos)
    raise NoPieceToMoveError if self[start_pos].is_a?(NullPiece)
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    #update positions
    #instantiate nullpiece at startpos in event of capture
    self[end_pos].pos = end_pos
  end 

  def valid_pos?(pos)
    row, col = pos 
    row.between?(0, 7) && col.between?(0, 7) 
  end

  def [](pos)
    row, col = pos 
    self.grid[row][col]
  end

  def []=(pos, val)
    row, col = pos 
    self.grid[row][col] = val 
  end 
  
end 

class InvalidPosError < StandardError; end 
class NoPieceToMoveError < StandardError; end 


class Piece 
  attr_accessor :pos 
  def initialize(color, board, pos)
    @color, @board, @pos = color, board, pos  
  end

  def to_s
    " p "
  end
end 

class NullPiece < Piece

  def initialize 
  end

  def to_s 
    " n "
  end 
end 
