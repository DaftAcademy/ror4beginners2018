def sort_letters(string)
   result = string.chars.sort!.lstrip
end

def count_vowels(string)
  string.scan(/[aeiouy]/).count
end


def filter_odd (array)
  array.keep_if{ |n| n.is_a?(Integer) }.keep_if(&:odd?)
  end


sort_letters('dcba') #=> 'abcd'
sort_letters('zyx') #=> 'xyz'

count_vowels('mmmm') #=> 0
count_vowels('super') #=> 2
count_vowels('super extra') #=> 4

filter_odd([1, 2, 3, 4, 5]) #=> [1, 3, 5]
filter_odd([6, 7, 9, 2, 6, 5]) #=> [7, 9, 5]
