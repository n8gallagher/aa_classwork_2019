require_relative 'tree_node.rb'

class KnightPathFinder

  def self.valid_moves(pos)
    row, col = pos
    row >= 0 && row < 8 && col >= 0 && col < 8
  end

  def initialize(pos)
    @pos = pos
    @root_node = PolyTreeNode.new(pos)
    @considered_positions = [pos]
    build_move_tree
  end

  def new_move_positions(pos)
    if KnightPathFinder.valid_moves(pos) && !(@considered_positions.include?(pos))
      @considered_positions << pos
      return pos
    end
    nil
  end

  def find_path(pos)

  end

  # build starting with root node
  # 
  
  def build_move_tree
    moves = [[2,-1], [2, 1], [-2, -1], [-2, 1], [-1, -2], [1, 2], [1, -2], [-1, 2]]
    @considered_positions.each do |node|
      pos = node.value
      moves.each do |move|
        new_pos = []
        new_pos << pos[0] + move[0]
        new_pos << pos[1] + move[1]
        if new_move_positions(pos)
           PolyTreeNode.new(new_pos).parent = node
        end
      end
      
    end
  end

end