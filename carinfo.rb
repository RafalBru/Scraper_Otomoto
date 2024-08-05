# Klasa reprezentuje samochód
#
# Klasa przechowuje informacje o samochodzie
class Carinfo
  # Atrybuty
  # @!attribute [r] image_url
  #   Link do obrazka samochodu.
  #
  # @!attribute [r] nazwa
  #   Marka i model samochodu.
  #
  # @!attribute [r] rok_produkcji.
  #   Rok wyprodukowania samochodu.
  #
  # @!attribute [r] rodzaj_paliwa
  #   Rodzaj paliwa, które ma samochód.
  #
  # @!attribute [r] skrzynia_biegów
  #   Skrzynia biegów, jaką posiada samochód.
  #
  # @!attribute [r] dodatkowe_informacje
  #   Dodatkowe informacje takie jak pojemność skokowa czy moc silnika
  #
  attr_reader :image_url, :nazwa, :rok_produkcji, 
  :rodzaj_paliwa, :skrzynia_biegow, :przebieg, 
  :dodatkowe_informacje
  # Inicjalizacja klasy
  #
  # * image_url [String] - Link do obrazu przedstawiającego dany samochód.
  # * nazwa [String] - Nazwa marki i modelu samochodu.
  # * rok [String] - Rok wyprodukownia samochodu.
  # * rodzaj_paliwa [String] - Rodzaj paliwa, który napędza samochód.
  # * skrzynia_biegow [String] - Rodzaj skrzynii biegów jaki posiada samochód.
  # * dodatkowe_informacje [String] - Dodakowe informacja takie jak pojemność skokowa czy moc silnia.
  def initialize(image_url,nazwa,rok,rodzaj_paliwa,skrzynia_biegow,przebieg,dodatkowe_informacje)
    @image_url = image_url
    @nazwa = nazwa
    @rok_produkcji = rok
    @rodzaj_paliwa = rodzaj_paliwa
    @skrzynia_biegow = skrzynia_biegow
    @przebieg = przebieg
    @dodatkowe_informacje = dodatkowe_informacje
  end
  # Funkcja generująca w terminalu informacje o danym samochodzie
  def print_info
    puts @image_url 
    print @nazwa ,@rok_produkcji ,@rodzaj_paliwa ,@skrzynia_biegow ,@przebieg, @pojemnosc_skokowa, @moc_silnika
    puts
  end
end
