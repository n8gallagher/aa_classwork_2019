require_relative 'cursor.rb'
require_relative 'board.rb'
require 'colorize'

class Display
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        puts "   #{(0..7).to_a.join("  ")}"
        @board.rows.each_with_index do |row, i|
            row_str = "#{i}  "
            row.each_with_index do |piece, j|
                if @cursor.cursor_pos == [i, j]
                    row_str << piece.symbol.to_s.colorize(:color => :red, :background => :cyan ) + "  "
                else
                    if piece.color == :black
                        row_str << piece.symbol.to_s.colorize(:color => :black, :background => :blue ) + "  "
                    else
                        row_str << piece.symbol.to_s.colorize(:color => :white, :background => :blue ) + "  "                       
                    end
                end
            end
            puts "#{row_str}"
        end
    end
end

board = Board.new
disp = Display.new(board)
disp.render