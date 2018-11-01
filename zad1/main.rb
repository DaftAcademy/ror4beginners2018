def sort_letters(string)
  string.delete(" ").chars.sort.join # pass to sort if char case matters (&:casecmp)
end

def count_vowels(string)
  string.count('aeiouy')
end

def filter_odd(array)
  array.select { |num| num.odd? }
end

puts sort_letters('dcba') #=> 'abcd'
puts sort_letters('zyx') #=> 'xyz'

puts count_vowels('mmmm') #=> 0
puts count_vowels('super') #=> 2
puts count_vowels('super extra') #=> 4

print nums = filter_odd([1, 2, 3, 4, 5]), "\n" #=> [1, 3, 5]
print nums2 = filter_odd([6, 7, 9, 2, 6, 5]) #=> [7, 9, 5]