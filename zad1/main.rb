def sort_letters(string)
	string.chars.sort.join
end

def count_vowels(string)
	result = 0
	string.each_char do |x|
		if['a', 'e', 'i', 'o', 'u', 'y'].include? x
			result += 1
		end
	end
	result
end

def filter_odd(array)
	result = []
	array.each do |x|
		if x.odd?
			result.append x
		end
	end
	result
end

sort_letters('dcba') #=> 'abcd'
sort_letters('zyx') #=> 'xyz'

count_vowels('mmmm') #=> 0
count_vowels('super') #=> 2
count_vowels('super extra') #=> 4

filter_odd([1, 2, 3, 4, 5]) #=> [1, 3, 5]
filter_odd([6, 7, 9, 2, 6, 5]) #=> [7, 9, 5]
