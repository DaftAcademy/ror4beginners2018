def sort_letters(string)
  string.letters_sorted if string.is_a?(String)
end

class String
  def letters_sorted
    extract_letters_sorted.join
  end

  def extract_letters_sorted
    extract_letters.sort
  end

  def extract_letters
    self.scan(/[a-zA-Z]/)
  end
end


def count_vowels(string)
  string.number_of_vowels? if string.is_a?(String)
end

class String
  def number_of_vowels?
    extract_vowels.length
  end

  def extract_vowels
    self.downcase
        .scan(/[aeiouy]/)
  end
end 


def filter_odd(array)
  array.select(&:is_a?.(Integer))
       .select(&:odd?) if array.is_a?(Array)
end

class Symbol
  def call(*args, &block)
    ->(caller, *rest) { caller.send(self, *rest, *args, &block) }
  end
end

sort_letters('dcba') #=> 'abcd'
sort_letters('zyx') #=> 'xyz'

count_vowels('mmmm') #=> 0
count_vowels('super') #=> 2
count_vowels('super extra') #=> 4

filter_odd([1, 2, 3, 4, 5]) #=> [1, 3, 5]
filter_odd([6, 7, 9, 2, 6, 5]) #=> [7, 9, 5]
