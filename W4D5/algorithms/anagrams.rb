require "byebug"

def permutation(array)
  return [array] if array.length <= 1
  # debugger
  first = array.shift
  new_arr = []
  perm_arr = permutation(array)
  perm_arr.each do |arr|
    (0..arr.length).each do |i|
      new_arr << (arr[0...i] + [first] + arr[i..-1])
    end
  end
  new_arr
end
# puts "-----"
# p permutation([1,2,3])
# puts "-----"
def first_anagram?(str1,str2)
  array = []
  permutation(str1.chars).include?(str2.chars)

end
# p first_anagram?("gizmo", "sally")
# p first_anagram?("elvis", "lives")
def second_anagram?(str1,str2)
  str1.each_char do  |char|
    str2_idx = str2.index(char)
    return false if str2_idx == nil
    str2[str2_idx] = ""
  end
  return true
end


p second_anagram?("gizmo", "sally")
p second_anagram?("elvis", "lives")

def third_anagram?(str1, str2)
  alpha = ("a".."z").to_a

  sorted = false
  while !sorted
    sorted = true
    str1.each_char.with_index do |char, i|
      if i != str1.length-1 && alpha.index(char) > alpha.index(str1[i+1])
        str1[i], str1[i+1] = str1[i+1], str1[i]
        sorted = false
      end
    end
  end

  sorted = false

  while !sorted
    sorted = true
    str2.each_char.with_index do |char, i|
      if i != str2.length-1 && alpha.index(char) > alpha.index(str2[i+1])
        str2[i], str2[i+1] = str2[i+1], str2[i]
        sorted = false
      end
    end
  end
  str1 == str2
end

def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1.each_char do |char|
    hash1[char] += 1
  end

  str2.each_char do |char|
    hash2[char] += 1
  end

  hash1 == hash2
end

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true