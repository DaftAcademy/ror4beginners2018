# Zadanie 5

1. Wykonaj wszystkie niezbędne czynności potrzebne do uruchomienia aplikacji. Może to być:
- `gem install bundler`
- `bundle`
- `rake db:setup`.
2. Przypatrz się dokładnie jak są zrobione kontrolery, znajdziesz je w folderze `app/controllers`.
3. wywołaj `rails s` i "przeklikaj się" po aplikacji.
4. Stwórz kontroler odpowiedzialny za artystów (nie zapomnij zmienić pliku `routes.rb`!). Stworzony kontroler powinien umożliwiać:
- wyświetlenie listy artystów (`index`)
- usunięcie istniejącego artysty (`destroy`)
- stworzenie nowego artysty (`create` wraz z akcją `new`)
- aktualizację istniejącego artysty (`update` wraz z akcją `edit`).

6. Popraw link prowadzący do artystów, znajdziesz go w pliku `_navbar.html.erb`
7. W tabeli zawierającej listę wszystkich utworów:
- popraw linki `edit` i `remove`
- w kolumnie `Playlists` wyświetl jako hiperłącza wszystkie playlisty, na których występuje dany utwór.

8. Dodaj o walidację: każdy utwór powinien posiadać tytuł.

Dodatkowo:
- stwórz widok danego artysty (`show`) z tabelą należących do niego utworów
- w tabeli zawierającej listę wszystkich utworów zamień nazwę artysty na hiperłącze

Jeśli nie masz pomysłu jak stworzyć widoki dla artystów - zobacz jak zostały napisane widoki dla utworów.

## references:
gem użyty do tworzenia formularzy
- https://github.com/plataformatec/simple_form
