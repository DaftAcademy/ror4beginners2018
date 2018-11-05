def sort_letters(string)
	string.char.sort_by(&:downcase).join
end

def count_vowels(string)
	string.scan(/[aeouiy]/).count
end

def filter_odd(array)
	array.select(&:odd?).join
end

puts sort_letters('dcba') #=> 'abcd'
puts sort_letters('zyx') #=> 'xyz'

puts count_vowels('mmmm')
puts count_vowels('super')
puts count_vowels('super extra')

puts filter_odd([1, 2, 3, 4, 5])
puts filter_odd([6, 7, 9, 2, 6, 5])