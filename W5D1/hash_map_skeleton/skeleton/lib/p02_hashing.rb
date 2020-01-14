class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    sum = 0
    self.each_with_index do |num, i|
      sum += num.object_id % (self.length + i)
    end
    sum
  end
end

class String
  def hash
    sum = 0
    (0...self.length - 1).each do |idx|
      sum += (self[idx].to_i(2) ^ (self[idx+1].to_i(2)))
    end
      sum
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
