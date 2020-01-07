require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if @board.over?
      return @board.winner != evaluator
    end

    self.children.any? do |node|
      node.losing_node?(evaluator)
    end
  end

  def winning_node?(evaluator)
    if @board.over?
      return @board.winner == evaluator 
    end

  
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    valid = []
    (0...3).each do |row|
      (0...3).each do |col|

        if @board.empty?([row, col])
          board_copy = @board.dup
          TicTacToeNode.new(board_copy, @next_mover_mark, [row,col])
        end
      end
    end
  end
end
