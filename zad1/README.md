# Zadanie 1
Zaimplementuj metody w pliku `main.rb`, tak aby:

  1. sort_letters sortowało ciąg liter i zwróciło je w postaci np. 'abcd'. Przykładowy input:
  2. count_vowels liczyło samogłoski w ciągu liter(a e i o u y)
  3. filter_odd zwróciło tablicę liczb nieparzystych
  
W części 1 i 2 dane wejściowe składają się z małych liter, które mogą być oddzielone spacjami, ale nie muszą.

Przykładowy input dla zadań:

1.
```ruby
sort_letters('dcba') #=> 'abcd'
sort_letters('zyx') #=> 'xyz'
```

2.
```ruby
count_vowels('mmmm') #=> 0
count_vowels('super') #=> 2
count_vowels('super extra') #=> 4
```
3.
```ruby
filter_odd([1, 2, 3, 4, 5]) #=> [1, 3, 5]
filter_odd([6, 7, 9, 2, 6, 5]) #=> [7, 9, 5]
```
