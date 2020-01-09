require_relative 'stepable.rb'
class Knight < Piece
    include Stepable
def symbol
        @symbol = :k
    end

    def move_diffs
        @move_diffs = [[1,2], [2,1], [-1,2], [-2,1],
                        [-1,-2], [-2,-1], [1, -2], [2, -1]]
    end


end