def sort_letters(string)
    string.chars.sort.join
end

def count_vowels(string)
    string.count('aeiouy')
end

def filter_odd(array)
    array.select(&:odd?)
end