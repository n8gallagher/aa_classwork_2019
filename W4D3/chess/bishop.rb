require_relative 'slideable.rb'

class Bishop < Piece
    include Slideable
    def symbol
        @symbol = :B
    end

    def move_dirs
        { :h => false, :d => true }
    end 

end