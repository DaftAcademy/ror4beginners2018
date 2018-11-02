def sort_letters(string)
	puts string.chars.sort.join
end

def count_vowels(string)
	vowels = Array['a', 'e', 'i', 'o', 'u', 'y']
	count = 0
	string.each_char { |letter|
		if vowels.include?(letter)
			count += 1
		end
	}
	puts count
end

def filter_odd(array)
	oddNumbers = Array.new
	for number in array
		if number % 2 != 0
			oddNumbers.push(number)
		end
	end
	puts "#{oddNumbers}"
end

sort_letters('dcba') #=> 'abcd'
sort_letters('zyx') #=> 'xyz'

count_vowels('mmmm') #=> 0
count_vowels('super') #=> 2
count_vowels('super extra') #=> 4

filter_odd([1, 2, 3, 4, 5]) #=> [1, 3, 5]
filter_odd([6, 7, 9, 2, 6, 5]) #=> [7, 9, 5]
