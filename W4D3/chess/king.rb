require_relative 'stepable.rb'
class King < Piece
    include Stepable

    def symbol
        @symbol = :K
    end

    def move_diffs
        [[0,1], [1,0], [-1,0], [0,-1], [1, 1], [-1,-1],[-1, 1], [1, -1]]
    end

end