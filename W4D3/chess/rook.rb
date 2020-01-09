require_relative 'slideable.rb'

class Rook < Piece
    include Slideable
    def symbol
        @symbol = :R
    end

    def move_dirs
        { :h => true, :d => false }
    end 
end