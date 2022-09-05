# Generating array
arr = Array.new(12) { rand(1...9) }
puts "Random array is: #{arr}"

# O(n^2)
duplicates = arr.find_all {|element| arr.count(element) > 1}.uniq
puts "Duplicates are: #{duplicates}"
puts "Number of duplicates groups = #{duplicates.length}"

# O(n)
hash_count = Hash.new()
hash_count.default = 0
duplicates = arr.find_all {|element|
  hash_count[element] += 1
  hash_count[element] == 2
}
puts "Duplicates are: #{duplicates}"
puts "Number of duplicates groups = #{duplicates.length}"