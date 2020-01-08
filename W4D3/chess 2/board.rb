require_relative 'null_piece.rb'
class Board
    def initialize
        @rows = Array.new(8) {Array.new(8)}
        @sentinel = NullPiece.new
    end

    def [](pos)
        x, y = pos
        @rows[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @rows[x][y] = val
    end

    def move_piece(color,start_pos, end_pos)
        #do this later
    end

    def valid_pos?(pos)
        pos.all? { |coord| (0..7).include?(coord) }
    end

    def add_piece(piece, pos)
        self[pos] = piece
    end

    def checkmate?(color)
        #do later
    end

    def in_check?(color)
        #later
    end
    def find_king(color)
    end
    def pieces
        #later
    end
    def dup
        self.rows.dup
    end

    def move_piece!(color, start_pos, end_pos)
        #later
    end
end