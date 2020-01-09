require_relative 'slideable.rb'

class Queen < Piece
    include Slideable

    
    def symbol
        @symbol = :Q
    end

    def move_dirs
        { :h => true, :d => true }
    end 

end