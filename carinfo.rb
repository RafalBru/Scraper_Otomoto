class Carinfo
  attr_reader :image_url, :nazwa, :rok_produkcji, :rodzaj_paliwa, :skrzynia_biegow

  def initialize(image_url,nazwa,rok,rodzaj_paliwa,skrzynia_biegow)
    @image_url = image_url
    @nazwa = nazwa
    @rok_produkcji = rok
    @rodzaj_paliwa = rodzaj_paliwa
    @skrzynia_biegow = skrzynia_biegow
  end
  def print_info
    puts @image_url 
    print @nazwa ,@rok_produkcji, @rodzaj_paliwa, @skrzynia_biegow
    puts
  end
end
