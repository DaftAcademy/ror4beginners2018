


def sort_letters(string)
    splittedInput = string.split("")
    splittedInput = splittedInput.sort
    splittedInput.delete_if{|char| char == ' '}
    splittedInput = splittedInput.join
    return splittedInput
end 

def count_vowels(string)
    vowels = ['a','e','i','o','u','y']
    return string.chars.count{|char| vowels.include?(char) }   
end

def filter_odd(arrayOfNumbers)
    arrayOfNumbers.delete_if {|arrayElement| arrayElement%2==0}
    return arrayOfNumbers
end

 
printf("%s \n", sort_letters('dcbafdgrexvc adf g'))
printf("%s \n", count_vowels('super aaa'))
printf("%s \n", filter_odd([6, 7, 9, 2, 6, 5,123,61,23,32]))

