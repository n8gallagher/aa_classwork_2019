class Piece
  def initialize(color, board, position)
    @color = color
    @board = board
    @position = position
  end

  def to_s
    self.symbol.to_s
  end

  def empty?
    #later
  end

  def valid_moves; end 

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