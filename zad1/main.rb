def sort_letters(string)
    string = string.chars.sort.join
end

def count_vowels(string)
    string.downcase!
    a = string.count("aeiouy")   
end

def filter_odd(array)
    array = array.select{ |n| n.odd? }
end

puts sort_letters('dcba') #=> 'abcd'
puts sort_letters('zyx') #=> 'xyz'

puts count_vowels('mmmm') #=> 0
puts count_vowels('super') #=> 2
puts count_vowels('super extra') #=> 4

puts filter_odd([1, 2, 3, 4, 5]).join(" , ") #=> [1, 3, 5]
puts filter_odd([6, 7, 9, 2, 6, 5]).join(" , ") #=> [7, 9, 5]

#Arkadisz Ryk 01.11.2018
