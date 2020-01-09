require_relative 'piece.rb'
require 'singleton'

class NullPiece < Piece 

  include Singleton
  attr_reader :color, :symbol

  def initialize
    super(nil, nil, nil)
    @color = nil 
    @symbol = nil
  end

  def moves
    nil
  end
end