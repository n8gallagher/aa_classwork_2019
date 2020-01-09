require_relative "piece.rb"

class Pawn < Piece
    def symbol
        @symbol = :p
    end

    def move_dirs
        return [ [0, self.forward_dir] ] if @color == :black
        return [ [0, self.forward_dir] ] if @color == :white 
    end

    def at_start_row?
        return true if @color == :black && @position[1] == 1
        return true if @color == :white && @position[1] == 6
        false
    end

    def forward_dir
        return 1 if @color == :black
        return -1 if @color == :white 
    end

    def forward_steps
        if at_start_row?
            return [ [0, self.forward_dir], [0, 2 * self.forward_dir] ]
        else 
            [ [0, self.forward_dir] ]
        end
    end

    def side_attacks
        [[1, self.forward_dir], [-1, forward_dir]]
    end

end