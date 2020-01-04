class PolyTreeNode
  attr_reader :value, :children
  attr_accessor :parent
  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(other_node)
    @parent.children.delete(self) if !@parent.nil?
    @parent = other_node

    other_node.children << self unless @parent.nil? || other_node.children.include?(self) 
  end

  def add_child(child_node)
    child_node.parent = self
  end
  def remove_child(child_node)
    raise "child does not exist" if !@children.include?(child_node)
    @children.delete(child_node) 
    child_node.parent = nil
  end

  def dfs(target_value)
    return nil if self == nil
    return self if self.value == target_value
    self.children.each do |child|
      search_result = child.dfs(target_value)
      return search_result unless search_result.nil?
    end
    nil
  end

  def bfs(target_value)
    arr = [self]

    until arr.empty?
      node = arr.shift
      node_val = node.value
      if node_val != target_value
        arr.append(*node.children)
      elsif node_val == target_value
        return node
      end
    end

    return nil


  end
end

    # create queue with self inside like [self]

    #until its empty we will dequeue the node, return the node if it matches target
    #if it doesn't match the target we will add the children of that node to the queue

    # if we get through it and we don't find it we will return nil


    #it'll go in the correct order becuase the queue will add one level at a time going from left to right
    #the queue will be in order going down and left to right for the for the order
    #we are looking to find nodes
