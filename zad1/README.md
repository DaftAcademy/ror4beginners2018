# Zadanie 1
Zaimplementuj metody w pliku `main.rb`, tak aby:

1. `sort_letters` sortowało podany ciąg znaków zgodnie z kolejnością w alfabecie
```ruby
sort_letters('dcba') #=> 'abcd'
sort_letters('zyx') #=> 'xyz'
```

2. `count_vowels` liczyło samogłoski w podanym ciągu znaków (a e i o u y)
```ruby
count_vowels('mmmm') #=> 0
count_vowels('super') #=> 2
count_vowels('super extra') #=> 4
```

3. `filter_odd` zwróciło podaną tablicę bez liczb parzystych
```ruby
filter_odd([1, 2, 3, 4, 5]) #=> [1, 3, 5]
filter_odd([6, 7, 9, 2, 6, 5]) #=> [7, 9, 5]
```
