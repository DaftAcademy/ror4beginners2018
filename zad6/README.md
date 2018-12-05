# Zadanie 6


1. W folderze `zad6` znajduje się szkielet aplikacji railsowej. Wykonaj wszystkie niezbędne czynności potrzebne do uruchomienia aplikacji. Może to być:
* `gem install bundler`
* `bundle`
* `rake db:setup`

2. Uzupełnij aplikację obsługującą sklep internetowy.
Stwórz następujące modele:
* `Customer` z atrybutem `name` i dowolnymi innymi
* `Product` z atrybutem `price` - cena w PLN z dokładnością do grosza
* `Category` z atrybutem `name` i dowolnymi innymi
* ewentualnie inne modele, które będą potrzebne do spełnienia innych wymagań (nazwij je jak chcesz)

3. [Relacje](https://guides.rubyonrails.org/association_basics.html) między nimi to:
* klient może zamówić wiele produktów
* produkt może być zamówiony tylko przez jednego klienta
* produkt może należeć do wielu kategorii
* kategoria może mieć wiele produktów

4. Endpointy:
* `GET /customers` powinno wyświetlać listę wszystkich klientów
* `GET /customers/:customer_id/products` powinno wyświetlać listę wszystkich produktów zamówionych przez klienta. Produkty powinny być posortowane według ceny malejąco.

*5. Zadanie dodatkowe:
* `GET /products?price=10` powinno wyświetlać listę produktów tańszych niż podano w parametrze `price`.

Pamiętaj o tematach poruszanych na ostatnich zajęciach - przydadzą się przy wykonywaniu tego zadania 🤔
