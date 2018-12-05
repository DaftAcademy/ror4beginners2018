# Zadanie 4

1. Wygeneruj model `Player` reprezentujący gracza piłki nożnej. W tabeli daj mu atrybuty:

- `captain` typu `boolean`, które nie może być puste i posiada domyślną wartość `false`
- `first_name` typu `string`, które nie może być puste
- `last_name` typu `string`, które nie może być puste
- `power` typu `integer`

2. W modelu zwaliduj istnienie atrybutów: 

- `first_name`
- `last_name`

3. Zwaliduj atrybut `power` tak, aby był większy niż 0 i mniejszy niż 100.

4. Zaimplementuj brakujące metody w klasie `FootballPlayerManager`, którą znajdziesz w folderze `app/services`. Przyjmuje ona jeden argument, instancję `Player`. Metody do zaimplementowania to:

- `stronger_players` - zwraca zawodników silniejszych niż podany zawodnik
- `set_power(value)` - ustawia podanemu zawodnikowi `power` na daną wartość
- `copy_player` - tworzy w bazie klona zawodnika i zwraca go

*\* Zadanie dodatkowe na dodatkowe punkty za aktywność:*

Stwórz widok zawodników, który zestawi ich w losowe, 11 osobowe drużyny. Każda drużyna powinna mieć jednego kapitana.

### UWAGI:
1. Jeśli generatory krzyczą wam o konfliktach to je ignorujcie literką `n`
2. Dane testowe można stworzyć poprzez wywołanie `rails db:seed` w konsoli, gdy już zaimplementujecie swój model.
3. Poprawność podstawowego wykonania zadania możecie sprawdzić poprzez wykonanie w konsoli komendy `rspec`. Na dniach postaramy się dodać CI :)

### Przykładowe wywołania `FootballPlayerManager`
```ruby
player = Player.first # => #<Player id: 1, first_name: "Top", last_name: "Kek", power: 20>
player_manager = FootballPlayerManager.new(player)
player_manager.stronger_players # => zwraca kolekcje silniejszych graczy
player_manager.copy_player # => #<Player id: 2, first_name: "Top", last_name: "Kek", power: 20>
player_manager.set_power(30) # => #<Player id: 1, first_name: "Top", last_name: "Kek", power: 30>
```
