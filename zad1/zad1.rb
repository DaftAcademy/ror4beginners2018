def sort_letters(string)
    string.reverse!
end

def count_vowels(string)
    i=0
    suma=0
    while i<=string.length
        if string[i]==a || string[i]==o || string[i]==u || string[i]==e || string[i]==i || string[i]==y 
            {           
                suma+1
                i+1
            }
        else
            i+1
        end
    puts suma                   
end

def filter_odd(array)
   i=0
   loop do
       if array[i]%2 !0 
          { 
              puts array[i].join(', ')
              i+1
          }   
       else
        i+1 
   break if i>=array.length
end

sort_letters('dcba') #=> 'abcd'
sort_letters('zyx') #=> 'xyz'

count_vowels('mmmm') #=> 0
count_vowels('super') #=> 2
count_vowels('super extra') #=> 4

filter_odd([1, 2, 3, 4, 5]) #=> [1, 3, 5]
filter_odd([6, 7, 9, 2, 6, 5]) #=> [7, 9, 5]