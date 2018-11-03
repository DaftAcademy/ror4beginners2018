def sort_letters(string)
	string.chars.sort.join
end

def count_vowels(string)
	string.count('aeiou')
end

def filter_odd(array)
	array.select.with_index{|e| e.odd?}
end

puts sort_letters('dcba') #=> 'abcd'
puts sort_letters('zyx') #=> 'xyz'

puts count_vowels('mmmm') #=> 0
puts count_vowels('super') #=> 2
puts count_vowels('super extra') #=> 4

array1 = filter_odd([1, 2, 3, 4, 5]) #=> [1, 3, 5]
array2 = filter_odd([6, 7, 9, 2, 6, 5]) #=> [7, 9, 5]
puts "#{array1}"
puts "#{array2}"
