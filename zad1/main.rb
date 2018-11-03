def sort_letters(string)
    return string.split("").sort().join
end

def count_vowels(string)
    vowels = 'eyuioa'
    odpowiedz = 0
    string.split("").each {
        |litera|
        if vowels.include?(litera)
            odpowiedz = odpowiedz + 1
        end
    }  
    return odpowiedz
end

def filter_odd(array)
    odpowiedz = Array.new
    array.each {
        |liczba|
        if liczba % 2 == 1
            odpowiedz.push(liczba)
        end
    }
    return odpowiedz
end

sort_letters('dcba') #=> 'abcd'
sort_letters('zyx') #=> 'xyz'

count_vowels('mmmm') #=> 0
count_vowels('super') #=> 2
count_vowels('super extra') #=> 4

filter_odd([1, 2, 3, 4, 5]) #=> [1, 3, 5]
filter_odd([6, 7, 9, 2, 6, 5]) #=> [7, 9, 5]
