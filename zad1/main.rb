def sort_letters(string)
p= string.chars.sort.join
    return p
end

def count_vowels(string)
    sum=0
    (0...string.size).each do |i|
        sum+=1 if string[i][/[aeiou]/]
    end
    return sum
end

def filter_odd (array)
    k=[]
    j=-1;
    (0...array.size).each do |i|
        k[j+=1]=array[i] if array[i].odd?
    end
    return k
end

sort_letters('dcba') #=> 'abcd'
sort_letters('zyx') #=> 'xyz'

count_vowels('mmmm') #=> 0
count_vowels('super') #=> 2
count_vowels('super extra') #=> 4

filter_odd([1, 2, 3, 4, 5]) #=> [1, 3, 5]
filter_odd([6, 7, 9, 2, 6, 5]) #=> [7, 9, 5]
