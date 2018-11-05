def sort_letters(string)
	return string.chars.sort.join
end


def count_vowels(string)
	count = 0
	array = ["a","i","e","o","u","y"]
	(0..array.length-1).each do |i|
			count += string.count(array[i])
	end
	return count
end

def filter_odd(array)
	i = 0
	count = 0   
	array2 = [0] 
	while i < array.length
		if(array[i].odd?)
			array2[count] = array[i]
			count += 1
		end
		i += 1
	end
	
	return array2
end

puts sort_letters('dcba') #=> 'abcd'
puts sort_letters('zyx') #=> 'xyz'

puts count_vowels('mmmm') #=> 0
puts count_vowels('super') #=> 2
puts count_vowels('super extra') #=> 4

print filter_odd([1, 2, 3, 4, 5]) #=> [1, 3, 5]
print filter_odd([6, 7, 9, 2, 6, 5]) #=> [7, 9, 5]

