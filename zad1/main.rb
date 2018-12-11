def sort_letters(str)
    str.chars.sort_by(&:downcase).join
end

def count_vowels(str)
    str.count "aeiuoy"
end

def filter_odd(arr)
    new_array = []
    l=arr.length-1
    iter=-1
    while iter<l do
        iter += 1
        unless arr[iter].odd?
            next
        end
        new_array.push(arr[iter]) end
    return new_array
end

sort_letters('dcba') #=> 'abcd'
sort_letters('zyx') #=> 'xyz'

count_vowels('mmmm') #=> 0
count_vowels('super') #=> 2
count_vowels('super extra') #=> 4

print [1, 2, 3] 
print "\n"

print filter_odd([1, 2, 3, 4, 5]) #=> [1, 3, 5]
print "\n"
print filter_odd([6, 7, 9, 2, 6, 5]) #=> [7, 9, 5]
print "\n"
print filter_odd([6, 2, 6])
print "\n"
print filter_odd([5, 7, 9, 1, 6, 5])
