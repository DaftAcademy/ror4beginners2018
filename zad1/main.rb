def sort_letters(string)
string.chars.sort.join
end

def count_vowels(string)
string.count("aeiouy")
end

def filter_odd(array)
array.select {|a| a.odd?}
end

sort_letters('dcba') #=> 'abcd'
sort_letters('zyx') #=> 'xyz'
puts sort_letters('dcba')
puts sort_letters('zyx')

count_vowels('mmmm') #=> 0
count_vowels('super') #=> 2
count_vowels('super extra') #=> 4
puts count_vowels('mmmm')
puts count_vowels('super')
puts count_vowels('super extra')


filter_odd([1, 2, 3, 4, 5]) #=> [1, 3, 5]
filter_odd([6, 7, 9, 2, 6, 5]) #=> [7, 9, 5]
a1 = filter_odd([1, 2, 3, 4, 5])
a2 = filter_odd([6, 7, 9, 2, 6, 5])
p a1
p a2