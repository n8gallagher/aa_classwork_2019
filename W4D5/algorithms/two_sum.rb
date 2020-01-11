def two_sum?(arr, target_sum)
   
end

arr = [0, 1, 5, 7]
two_sum?(arr, 6) # => should be true
two_sum?(arr, 10) # => should be false


def bad_two_sum?(arr, target_sum)
  (0...arr.length-1).each do |i|
    (i+1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target_sum
    end
  end
  false
end

# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false


def okay_two_sum?(arr, target_sum)
  sorted = arr.sort
  sorted.each_with_index do |el, idx|
    el2 = target_sum - el
    return true if bsearch(sorted, el2)
  end
  false
end

def bsearch(arr, target_sum)
  left = 0
  right = arr.length - 1
  while left <= right
    mid = (left + right) / 2
     return true if arr[mid] == target_sum
     if arr[mid] < target_sum
      left = mid + 1
     else
      right = mid - 1
     end
  end
  false
end

p bsearch([1,2,3,4], 5)
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false