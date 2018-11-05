def sort_letters(string)
    print(string,'->',string.chars.sort.join,"\n")
end

def count_vowels(string)
    print("\"",string,"\"",' zawiera: ',string.scan(/[aeiou]/).count,' samoglosek',"\n")
    #puts(string.scan(/[aeiou]/).count)
end

def filter_odd(array)
    #puts array.select &:odd?
    print array, " -> ", array.select{|a| a.odd?},"\n"
end

sort_letters('dcba')
sort_letters('zyx')

count_vowels('mmmm')
count_vowels('super')
count_vowels('super extra')

filter_odd([1,2,3,4,5])
filter_odd([6,7,9,2,6,5])
