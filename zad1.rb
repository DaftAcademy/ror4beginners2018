def sort_letters(string)
	n = (string.length-1)
	begin
		k = 0
		poprzedni = string[0]
		for i in 1..n
			if string[i] < poprzedni then
				string[i-1] = string[i]
				string[i] = poprzedni
				k += 1
			end
			poprzedni = string[i]
		end
	end while k != 0
	puts string
end

def count_vowels(string)
	v,c = string.chars.partition{|i| ["a","e","y","i","o","u"].include?(i)}
	puts v.length
end

def filter_odd(array)
	array2 = Array.new
	for i in 0..(array.length-1)
		if array[i]%2 != 0 then
			array2.push array[i]
		end
	end
	print array2
	puts ""
end

sort_letters('dcba') #=> 'abcd'
sort_letters('zyx') #=> 'xyz'

count_vowels('mmmm') #=> 0
count_vowels('super') #=> 2
count_vowels('super extra') #=> 4

filter_odd([1, 2, 3, 4, 5]) #=> [1, 3, 5]
filter_odd([6, 7, 9, 2, 6, 5]) #=> [7, 9, 5]