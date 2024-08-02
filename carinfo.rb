class Carinfo
  attr_reader :image_url, :nazwa, :rok_produkcji, 
  :rodzaj_paliwa, :skrzynia_biegow, :przebieg, 
  :dodatkowe_informacje

  def initialize(image_url,nazwa,rok,rodzaj_paliwa,skrzynia_biegow,przebieg,dodatkowe_informacje)
    @image_url = image_url
    @nazwa = nazwa
    @rok_produkcji = rok
    @rodzaj_paliwa = rodzaj_paliwa
    @skrzynia_biegow = skrzynia_biegow
    @przebieg = przebieg
    @dodatkowe_informacje = dodatkowe_informacje
  end
  def print_info
    puts @image_url 
    print @nazwa ,@rok_produkcji, @rodzaj_paliwa, @skrzynia_biegow, @przebieg, @pojemnosc_skokowa, @moc_silnika
    puts
  end
end
