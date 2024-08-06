# Klasa reprezentuje samochód
#
# Klasa przechowuje informacje o samochodzie
class Carinfo
  # Link do obrazka samochodu
  attr_reader :image_url

  # Marka i model samochodu
  attr_reader :nazwa

  # Rok wyprodukowania samochodu
  attr_reader :rok_produkcji

  # Rodzaj paliwa, które napędza samochód
  attr_reader :rodzaj_paliwa

  # Skrzynia biegów, jaką posiada samochód
  attr_reader :skrzynia_biegow

  # Przebieg samochodu
  attr_reader :przebieg

  # Dodatkowe informacje
  attr_reader :dodatkowe_informacje

  # Inicjalizacja klasy
  #
  # * image_url [String] - Link do obrazu przedstawiającego dany samochód.
  # * nazwa [String] - Nazwa marki i modelu samochodu.
  # * rok [String] - Rok wyprodukownia samochodu.
  # * rodzaj_paliwa [String] - Rodzaj paliwa, który napędza samochód.
  # * skrzynia_biegow [String] - Rodzaj skrzynii biegów jaki posiada samochód.
  # * dodatkowe_informacje [String] - Dodakowe informacja takie jak pojemność skokowa czy moc silnia.
  def initialize(image_url,nazwa,rok_produkcji,rodzaj_paliwa,skrzynia_biegow,przebieg,dodatkowe_informacje)
    @image_url = image_url
    @nazwa = nazwa
    @rok_produkcji = rok_produkcji
    @rodzaj_paliwa = rodzaj_paliwa
    @skrzynia_biegow = skrzynia_biegow
    @przebieg = przebieg
    @dodatkowe_informacje = dodatkowe_informacje
  end
  # Funkcja generująca w terminalu informacje o danym samochodzie
  def print_info
    puts "Link do obrazu: #{@image_url}"
    puts "Samochód: #{@nazwa}, Rok produkcji: #{@rok_produkcji}"
    puts "Rodzaj paliwa: #{@rodzaj_paliwa}, Skrzynia biegów: #{@skrzynia_biegow}"
    puts "Przebieg: #{@przebieg}"
    puts "Pojemnosc silnika: #{@dodatkowe_informacje[0]}, Moc silnika: #{@dodatkowe_informacje[1]}"
  end
end
