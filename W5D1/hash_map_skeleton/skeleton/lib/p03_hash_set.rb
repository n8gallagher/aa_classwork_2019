require "byebug"
class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count == num_buckets
    # key = key.hash
    @store[key.hash % num_buckets] << key
    # debugger
    @count += 1
  end

  def include?(key)
    # key = key.hash 
    @store[key.hash % num_buckets].include?(key)
  end

  def remove(key)
    if self.include?(key)
      # key = key.hash 
      @store.delete(@store[key.hash % num_buckets])
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    @store += Array.new(num_buckets) { Array.new }
  end
end
