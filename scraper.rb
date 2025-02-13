require "httparty"
require "nokogiri"
require_relative 'carinfo.rb'
# Klasa reprezentuje Scraper.
#
# Klasa umożliwiająca zbieranie informacji ze strony internetowej
class Cars_scraper
  # Inicjalizacja klasy
  #
  # * arr [Array] - Tablica, do której będą zbierane obiekty (samochody).
  def initialize(arr)
    @arr = arr
  end

  # Funkcja zbierająca informacje ze strony internetowej
  def scrap_cars
    page = 1
    4.times do
      puts "Page #{page}"
      response = HTTParty.get("https://www.otomoto.pl/osobowe?page=#{page}")
      doc = Nokogiri::HTML(response.body)
      cars = doc.xpath('//section')
  
      cars.each do |car|
        image_url = car.at_xpath('.//img')&.[]('src')
        car_name = car.at_xpath('.//h1//a')&.text&.strip
        rok_produkcji = car.at_xpath('.//dt[contains(text(),"Rok produkcji")]//following-sibling::dd[1]')&.text&.strip
        paliwo = car.at_xpath('.//dt[contains(text(),"Rodzaj paliwa")]//following-sibling::dd[1]')&.text&.strip
        skrzynia_biegow = car.at_xpath('.//dt[contains(text(),"Skrzynia biegów")]//following-sibling::dd[1]')&.text&.strip
        przebieg = car.at_xpath('.//dt[contains(text(),"Przebieg")]/following-sibling::dd[1]')&.text&.strip
        dodatkowe_informacje = car.xpath('.//h1/following-sibling::p[1]').text.strip.split(" • ")

        if car_name && rok_produkcji && paliwo && skrzynia_biegow && dodatkowe_informacje
          car_info = Carinfo.new(
            image_url,
            car_name,
            rok_produkcji,
            paliwo,
            skrzynia_biegow,
            przebieg,
            dodatkowe_informacje)
          @arr.push(car_info)
          car_info.print_info
        end
      end
      page += 1
    end
    return @arr
  end
end
# url -> <img>
# cars.each do |car|
# image_url = car.at_xpath('.//img')
# if image_url
#  puts image_url['src']
#  puts "---"
# end
# end
# marka, model <h1>
# cars.each do |car|
#   car_name = car.at_xpath('.//h1//a')
#   if car_name
#     puts car_name.text.strip
#     puts '==='
#   end
# end
# rok_prod, paliwo, skrzynia_biegów <div> -> <dd>
# cars.each do |car|
#   rok_produkcji = car.at_xpath('.//dt[contains(text(),"Rok produkcji")]//following-sibling::dd[1]')
#   paliwo = car.at_xpath('.//dt[contains(text(),"Rodzaj paliwa")]//following-sibling::dd[1]')
#   skrzynia_biegow = car.at_xpath('.//dt[contains(text(),"Skrzynia biegów")]//following-sibling::dd[1]')
#   if paliwo
#     puts rok_produkcji.text.strip
#     puts paliwo.text.strip
#     puts skrzynia_biegow.text.strip
#     puts '==='
#   end


