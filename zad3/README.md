# Zadanie 3
Wykorzystując `BestiaryController` i zawartą w nim metodę `monsters`:
1. Zaimplementuj akcję `index`, tak aby jej widok wyświetlił wszystkie atrybuty potworów (`id`, `name`, `location`, `best_slayer`).
2. Zaimplementuj akcję novigrad_monsters, która na podstawie metody `monsters`, która wyświetli atrybuty potworów z Novigradu.

Założenia:
1. Do wyświetlania używaj widoków railsowych
2. Każdy widok powinien mieć nagłówek Witcher's Bestiary
3. Metoda `monsters` zwraca potwory w formacie:
```ruby
[
  { id: 0, name: "Ignis Fatuus", location: "Ban Gleán", best_slayer: "Birna Bran" },
  { id: 1, name: "Fiend", location: "Pont Vanis", best_slayer: "Saskia" }
]
```
4. Przykładowy kod html z tablicą wyświetlającą potwory. Każdy następujący tag <tr> to kolejny wiersz w tabeli.

```html
<table>
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Location</th>
    <th>Best slayer</th>
  </tr>
  <tr>
    <td>245</td>
    <td>Ghoul</td>
    <td>Behind you</td>
    <td>Nobody</td>
  </tr>
  <tr>
    <td>128</td>
    <td>Vampire</td>
    <td>Above you</td>
    <td>John Doe</td>
  </tr>
</table>
```
5. Style CSS są już gotowe w projekcie
