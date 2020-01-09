class Piece
  attr_reader :color, :position
  def initialize(color, board, position)
    @color = color
    @board = board
    @position = position
  end

  def to_s
    self.symbol.to_s
  end

  def empty?
    # checking self is NullPiece
    self.symbol == nil
  end

  def valid_moves
    if self.class == Pawn
      self.move_dirs
    else
      self.moves
    end
  end 

  def pos=(val)
    @position = val
  end

  def symbol
    :Peice
  end

  def move_into_check?(end_pos)
    #later
  end
end