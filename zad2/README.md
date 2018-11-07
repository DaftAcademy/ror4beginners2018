# Zadanie 2
# Warriors

## Założenia:
  - Istnieją dwa rodzaje postaci: Wojownicy i Potwory.
  - Każda postać znajduje się na określonym poziomie, którego wartość mieści się w przedziale od 1 do 99.
  - Postaci mogą walczyć między sobą, w trakcie walki każda ze stron rzuca kością K12 (dwunastościenną).
  - Siła postaci w trakcie walki to suma jej poziomu i wyniku rzutu kością. Postać z większą siłą wygrywa.
  - Gdy walkę wygrywa wojownik, jego poziom zwiększa się w zależności od poziomu przeciwnika (+1 dla tego samego poziomu, +1 dla każdego kolejnego).
  - Poziom potworów nigdy się nie zmienia.

## Wykonanie:
  - Uzupełnij klasę `Warrior` w taki sposób, aby zapamiętywała imię i poziom wojownika przekazane przy tworzeniu obiektu.
  - Zaimplementuj metodę `strength` zwracającą siłę postaci (poziom + wynik rzutu kością).
  - Dodaj metodę `card`, która zwróci tekst zawierający imię i poziom postaci.
  - Stwórz klasę `Monster` przyjmującą w konstruktorze imię i poziom potwora.
  - Czy widzisz wspólne cechy klas `Monster` i `Warrior`? Jeśli tak przenieś je do klasy `Character` i użyj dziedziczenia, aby ułatwić sobie życie.
  - Stwórz metodę `battle!` w klasie `BattleArena`, która przeprowadzi walkę między postaciami na arenie.
  - Pamiętaj, że po wygranej walce poziom wojownika zwiększa się zgodnie z założeniami.

## Tips:
  - do rzutu z kością możesz użyć polecenia `[*1..12].sample`, które zwróci losową liczbę z przedziału 1-12

## Przykładowy przebieg rozgrywki:

#### 1. Stworzenie postaci
zauważ, że metoda strength zwraca losową wartość (poziom + wynik rzutu kością)
``` ruby

warrior1 = Warrior.new(name: 'Po', level:  1)
warrior2 = Warrior.new(name: 'Tai Lung', level: 1)
monster1 = Monster.new(name: 'Skeleton Mage', level: 15)
```


``` ruby
warrior1.card # => Po (lvl 1)
warrior1.strength # => 6
warrior1.strength # => 5
warrior2.card # => Tai Lung (lvl 1)
monster1.card # => Skeleton Mage (lvl 15)
```

#### 2. Stworzenie areny z dwoma walczącymi wojownikami i zainicjalizowanie walki
Wygrany wojownik zdobywa jeden punkt
``` ruby
arena = BattleArena.new(warrior1, warrior2)
arena.battle!
# ->  Po attacked Tai Lung with 6 damage
# ->  Tai Lung attacked Po with 8 damage
# ->  Tai Lung won

warrior1.card # => Po (lvl 1)
warrior2.card # => Tai Lung (lvl 2)
```

#### 3. Powtórzenie walki
Wygrany wojownik zdobywa dwa punkty
``` ruby
arena.battle!
# ->  Po attacked Tai Lung with 10 damage
# ->  Tai Lung attacked Po with 7 damage
# ->  Po won
warrior1.card # => Po (lvl 3)
```

#### 4. Stworzenie areny z dwoma walczącym wojownikiem i potworem
Wygrany potwór nie zdobywa punktów
``` ruby
arena = BattleArena.new(warrior1, monster1)
arena.battle!
# ->  Po attacked Skeleton Mage with 13 damage
# ->  Skeleton Mage attacked Po with 18 damage
# ->  Skeleton Mage won

monster1.card # => Skeleton Mage (lvl 15)
```
