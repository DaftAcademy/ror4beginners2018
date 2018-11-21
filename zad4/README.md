# Zadanie 4

1. Wygeneruj model `FootballPlayer`. W tabeli daj mu atrybuty:

- `captain` typu `boolean`, które nie może być puste i posiada domyślną wartość false
- `first_name` typu `string`, które nie może być puste
- `last_name` typu `string`, które nie może być puste
- `power` typu `integer`

2. W modelu zwaliduj istnienie atrybutów: 

- `first_name`
- `last_name`

3. Zwaliduj atrybut `power` tak, aby był większy niż 0 i mniejszy niż 100.

4. Zaimplementuj klasę `FootballPlayerManager`, którą znajdziesz w folderze `services`. Przyjmuje ona jeden argument, instancję `FootballPlayer`. Posiada ona metody:

- `stronger_players` - zwraca zawodników silniejszych niż podany zawodnik
- `set_power(value)` - ustawia podanemu zawodnikowi `power` na daną wartość
- `copy_player` - tworzy w bazie klona zawodnika

\* Zadanie dodatkowe na dodatkowe punkty za aktywność

Stwórz widok zawodników, który zestawi ich w losowe, 11 osobowe drużyny. Każda drużyna powinna mieć jednego kapitana.
