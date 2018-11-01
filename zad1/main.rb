def sort_letters(string)
    string = string.chars.sort.join
end

def count_vowels(string)
    string.downcase!
    a = string.count("aeiouy")   
end

def filter_odd(array)
    array = array.select{ |n| n.odd? }
end

#Arkadisz Ryk 01.11.2018
