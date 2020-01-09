require_relative 'piece.rb'
require_relative 'null_piece.rb'
require_relative 'queen.rb'
require_relative 'king.rb'
require_relative 'pawn.rb'
require_relative 'bishop.rb'
require_relative 'knight.rb'
require_relative 'rook.rb'

class Board
    attr_reader :rows
    def initialize
        @rows = Array.new(8) {Array.new(8)}
        @sentinel = NullPiece.instance

        # fill empty square
        (2..5).each do |row|
            (0..7).each do |i|
                self[[row, i]] = @sentinel
            end
        end

        # place pawns
        (0..7).each do |i|
            self[[1, i]] = Pawn.new(:black, self, [1, i])
            self[[6, i]] = Pawn.new(:white, self, [6, i])
            if i == 0 || i == 7
                self[[0, i]] = Rook.new(:black, self, [0,i])
                self[[7, i]] = Rook.new(:white, self, [7,i])
            end
            if i == 1 || i == 6
                self[[0, i]] = Knight.new(:black, self, [0,i])
                self[[7, i]] = Knight.new(:white, self, [7,i])
            end
            if i == 2 || i == 5
                self[[0, i]] = Bishop.new(:black, self, [0,i])
                self[[7, i]] = Bishop.new(:white, self, [7,i])
            end
            if i == 3 
                self[[0, i]] = Queen.new(:black, self, [0,i])
                self[[7, i]] = Queen.new(:white, self, [7,i])
            end
            if i == 4 
                self[[0, i]] = King.new(:black, self, [0,i])
                self[[7, i]] = King.new(:white, self, [7,i])
            end

        end

    end

    def [](pos)
        x, y = pos
        @rows[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @rows[x][y] = val
    end

    def move_piece(start_pos, end_pos)
        
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
        king_pos = self.find_king(color) #if anything can attack return true else false
        other_color = ( color == :black ? :white : :black ) 

        other_color_pieces = []
        @rows.each do |row|
            row.each do |ele|
                other_color_pieces << ele if ele.color == other_color
            end
        end

        other_color_pieces.each do |piece|
            if piece.symbol == :p
                current_side_attacks = piece.side_attacks.map do |move| 
                    [move[0] + piece.position[0], move[1] + piece.position[1]]
                end
                return true if current_side_attacks.include?(king_pos)
            else
                current_moves = piece.moves.map do |move|
                    [move[0] + piece.position[0], move[1] + piece.position[1]]
                end
                return true if current_moves.include?(king_pos)
            end
            
        end
        false
    end

    def find_king(color)
        @rows.each_with_index do |row, idx1|
           row.each_with_index do |ele, idx2|
            return [idx1, idx2] if ele.symbol == :K && ele.color == color
           end
        end
    end

    def pieces
        #later
    end
    def dup
        arr = []
        @rows.each do |row|
            new_row = []
            row.each do |ele|
                new_row << ele.dup
            end
            arr << new_row
        end
        arr
    end

    def move_piece!(color, start_pos, end_pos)
        piece = self[start_pos] # piece instance
        self[start_pos] = @sentinel
        self[end_pos] = piece
        piece.pos = end_pos
    end
end


# board = Board.new
# board.move_piece!(:black, [0,3], [2,4])

# board.move_piece!(:white, [7,4], [5,4])

# puts "white king pos"
# p board.find_king(:white)
# puts "black queen moves"
# p board[[2,4]].symbol
# p board[[2,4]].position
# p board[[2,4]].moves
# puts "check"
# p board.in_check?(:white)
# p board.in_check?(:black)