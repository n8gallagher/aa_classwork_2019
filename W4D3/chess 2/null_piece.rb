require_relative 'piece.rb'

class NullPiece < Piece 

  include Singleton
  attr_reader :color, :symbol

  def initialize
    super
    @color = nil 
    @symbol = nil
  end


end