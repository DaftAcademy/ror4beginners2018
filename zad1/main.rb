def sort_letters(string)
   return ((string.split('')).sort).join('')
end

def count_vowels(string)
    sum = 0
    ['a','e','i','o','u','y'].each{|s| sum += string.count(s)}
    return sum
end

def filter_odd(array)
    array.each do |t|
        array.delete(t) if t%2 == 0
    end
    return array
end

sort_letters('dcba') #=> 'abcd'
sort_letters('zyx') #=> 'xyz'

count_vowels('mmmm') #=> 0
count_vowels('super') #=> 2
count_vowels('super extra') #=> 4

filter_odd([1, 2, 3, 4, 5]) #=> [1, 3, 5]
filter_odd([6, 7, 9, 2, 6, 5]) #=> [7, 9, 5]
