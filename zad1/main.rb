def sort_letters(k)
p= k.chars.sort.join
    return p
end

def count_vowels(k)
    sum=0
    (0...k.size).each do |i|
        sum+=1 if k[i][/[aeiou]/]
    end
    return sum
end

def filter_odd (a)
    k=[]
    j=-1;
    (0...a.size).each do |i|
        k[j+=1]=a[i] if a[i].odd?
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
