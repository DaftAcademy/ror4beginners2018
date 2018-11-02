def sort_letters(string)
    i=0
    while i<string.length
        j=i
        while j<string.length
            if string[i]>string[j]
                w=string[j]
                string[j]=string[i]
		string[i]=w
            end
            j+=1
        end
        i+=1
    end
    return string
end

def count_vowels(string)
    x=0
    i=0
    while i<string.length 
        if string[i]=='a' || string[i]=='e' || string[i]=='i' || string[i]=='o' || string[i]=='u' || string[i]=='y'
        x+=1
        end
    i+=1
    end
    return x
end

def filter_odd(array)
    for i in array
        if i%2 == 0
            array.delete(i)
        end
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
