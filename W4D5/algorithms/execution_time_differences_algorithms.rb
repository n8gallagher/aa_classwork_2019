def my_min1(arr)
  i = 0
  while i < arr.length
    smallest = true
    current_ele = arr[i]
    j = 0
    while j < arr.length
      if current_ele > arr[j]
        smallest = false
      end
      j += 1
    end
    if smallest == true
      return current_ele
    end
    i += 1
  end
  false
  
end

def my_min2(arr)
  i = 0
  min = arr[i]
  while i < arr.length
      min = arr[i] if arr[i] < min
    i += 1
  end
  min
end

#keep track of 

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min2(list)  # =>  -5

def largest_contiguous_subsum1(arr)
  new_arr = []
  (0...arr.length).each do |i|
    (i...arr.length).each do |j|
      new_arr << arr[i..j] #O(n**3) beacuse this stpe costs O(n) also - slicing costs O(n)
    end
  end
  new_arr.max_by { |subarr| subarr.sum }.sum
end

def largest_contiguous_subsum2(arr)
  max_sum = arr[0]
  cur_sum = arr[0]
  (1...arr.length).each do |i|
    
    cur_sum += arr[i]
    if cur_sum <= 0 
      
      max_sum = [max_sum, cur_sum].max
      cur_sum = 0
    else
      max_sum = [max_sum, cur_sum].max
    end
  end

  return arr.max if arr.all?{|el| el < 0}
  max_sum
end

list = [5, 3, -7]
p largest_contiguous_subsum2(list) # => 8

list2 = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum2(list2) # => 8

list3 = [-5, -1, -3]
p largest_contiguous_subsum2(list3) # => -1

list4 = [2, 3, 6, 7, 6, 7]
p largest_contiguous_subsum2(list4) # => 31
p list4.sum #=> 31




