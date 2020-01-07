require_relative 'tree_node.rb'

class KnightPathFinder

  def self.valid_moves(pos)
    row, col = pos
    row >= 0 && row < 8 && col >= 0 && col < 8
  end

  attr_reader :root_node
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

    queue = [@root_node]
    # @considered_positions.each do |position|
      # pos = node.value # modify to reflect pos
    until queue.empty?
      node = queue.shift
      position = node.value
      moves.each do |move|
        new_pos = []
        new_pos << position[0] + move[0]
        new_pos << position[1] + move[1]
        if new_move_positions(new_pos)
           new_node = PolyTreeNode.new(new_pos) 
           new_node.parent = node 

           queue << new_node
        end
      end
    end
    # end
  end

  def find_path(end_pos)
    end_node = self.root_node.bfs(end_pos)
    self.trace_path_back(end_node)
  end

  def trace_path_back(end_node)
    path = [end_node.value]
    current_node = end_node
    until @root_node == current_node
      # @root_node.children.include?(current_node)
      current_node = current_node.parent
      # p current_node
      path.unshift(current_node.value)
    end

    path
  end


end

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]


