def sort_letters(string)
	string.gsub(/\s+/, '').split('').sort.join
end

def count_vowels(string)
	def isVowel s
		'aeiouy'.each_char {|a| return true if a.eql?(s)}
	false
end
	string.each_char.select {|a| isVowel(a)}.length
end

def filter_odd(array)
	array.select(&:odd?)
end