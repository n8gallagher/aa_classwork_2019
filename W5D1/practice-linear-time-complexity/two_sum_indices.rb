def two_sum_indices(arr, target_sum)
    complements = {}
    arr.each_with_index do |el, i|
      complement, j = complements[target_sum - el] # these will both be nil if the complement doesn’t exist
      return [i, j] if complement
      complements[el] = [el, i]
    end
    nil
  end
  a = [2,2,3,1,5,7,14,-1]
  p two_sum_indices(a, 4) # => [[0,1],[2,3],[4,7]]
  p two_sum_indices(a,6) # => [[3,4]]
  p two_sum_indices(a,20) # => []