

class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
    @set = []
  end

  def insert(num)
   if num < @max && num > 0 && !@store.include?(num)
     @store[num] = true
     @set << num 
   end
  end

  def remove(num)
    @store[num] = false if @set.include?(num)
  end

  def include?(num)
    @store[num]
  end
end