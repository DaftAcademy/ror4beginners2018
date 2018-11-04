def sort_letters(string)
    string.chars.sort_by(&:downcase).join
end

def count_vowels(string)
    string.scan(/[aeiouy]/).count
end

def filter_odd(array)
    array.select(&:odd?).join
end

puts sort_letters('dcba') #=> 'abcd'
puts sort_letters('zyx') #=> 'xyz'

puts count_vowels('mmmm') #=> 0
puts count_vowels('super') #=> 2
puts count_vowels('super extra') #=> 4

puts filter_odd([1, 2, 3, 4, 5]) #=> [1, 3, 5]
puts filter_odd([6, 7, 9, 2, 6, 5]) #=> [7, 9, 5]
