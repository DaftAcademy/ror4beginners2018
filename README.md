# Ruby on Rails 4 beginners

![alt text](https://github.com/daftcode/ror4beginners2018/blob/master/logo.png)

## Plan zajęć

![alt text](https://github.com/daftcode/ror4beginners2018/blob/master/plan_zajec.png)

## Przygotowanie do zajęć

### instalacja ruby

#### Linux/Unix/Mac os

Jeśli masz system z rodziny Unix sprawa jest dosyć prosta - wystarczy wywołać w terminalu komendę `irb`, aby wyświetlić znak zachęty interpretera rubiego.

```
➜  ~ irb
2.5.1 :001 > 
```

Jeśli jednak tak się nie stało, a komenda `which ruby` nic nie zwraca, postępuj zgodnie z instukcjami w linku:

Debian lub Ubuntu:
https://www.ruby-lang.org/pl/documentation/installation/#apt

OS X:
https://www.ruby-lang.org/pl/documentation/installation/#homebrew

Arch Linux:
https://www.ruby-lang.org/pl/documentation/installation/#pacman

Gentoo:
https://www.ruby-lang.org/pl/documentation/installation/#gentoo

CentOS, Fedora lub RHEL:
https://www.ruby-lang.org/pl/documentation/installation/#yum

#### Windows

![alt text](https://i.gifer.com/1EAo.gif)

Z Windowsem sprawa jest nieco bardziej skomplikowana. Jeśli nie instalowałeś rubiego samodzielnie - prawdopodobnie go nie masz. Należy w takim razie wejść na https://rubyinstaller.org/downloads/ i ściągnąć najnowszą wersję `Ruby+Devkit 2.5.X`

Windows i Ruby on Rails nie są najlepszymi kumplami, dlatego mając system Microsoftu warto zainstalować sobie maszynę wirtualną z dowolnym systemem Linux i pracować na niej - unikniesz w ten sposób bólu głowy.

### Wybór edytora tekstu

Programowanie w Rubym nie wymaga żadnych specjalistycznych narzędzi - wystarczy korzystać z edytora tekstu. Na zajęciach możesz korzystać z dowolnego edytora. Jeżeli nie wiesz co wybrać, polecamy VS Code https://code.visualstudio.com/.

## Przesyłanie zadań domowych

Aby przesłać nam rozwiązane zadania należy zrobić:
  * fork projektu (prawy górny róg githuba)
  * pobrać go do swojego lokalnego środowiska `git clone ...`
  * stworzyć nowy branch z nazwą zadania `git checkout -b 'zad1'` && `git push --set-upstream origin zad1`
  * rozwiązać zadanie i wrzucić do swojego forka `git commit -m ''` && `git push`
  * stworzyć pull request do `daftcode/ror4beginners2018`

## Pytania / kontakt
Jak macie jakieś pytania, albo coś nie działa, dajcie znać na ror@daftacademy.pl lub napiszcie issue.
