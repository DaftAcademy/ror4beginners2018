def sort_letters(string)
  puts string.chars.sort.join
end

def count_vowels(string)
  print string.count('aeiou')
end

def filter_odd(array)
  print array.find_all { |i| i % 2 == 1}
end


sort_letters('dabc') #=> 'abcd'
sort_letters('zyx') #=> 'xyz'

count_vowels('mmmm') #=> 0
count_vowels('super') #=> 2
count_vowels('super extra') #=> 4

filter_odd([1, 2, 3, 4, 5]) #=> [1, 3, 5]
filter_odd([6, 7, 9, 2, 6, 5]) #=> [7, 9, 5]
