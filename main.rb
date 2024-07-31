require "httparty"
require "nokogiri"
require "csv"
require_relative "carinfo.rb"

response = HTTParty.get("https://www.otomoto.pl/osobowe?page=1")
# def generate_csv(cars)
#   CSV.open("otomoto.tsv","wb",col_sep:"\t") do |csv|
#     #csv << ["Link","Marka","Model","Rok produkcji","Paliwo","Skrzynia biegów"]
#     csv << ["MARKA","MODEL"]
#     cars.each do |car|
#       marka, model = car.split(" ",2)
#       csv << [marka, model]
#     end
#   end
# end

doc = Nokogiri::HTML(response.body)
cars = doc.xpath('//section')

cars.each do |car|
  image_url = car.at_xpath('.//img')
  car_name = car.at_xpath('.//h1//a')
  rok_produkcji = car.at_xpath('.//dt[contains(text(),"Rok produkcji")]//following-sibling::dd[1]')
  paliwo = car.at_xpath('.//dt[contains(text(),"Rodzaj paliwa")]//following-sibling::dd[1]')
  skrzynia_biegow = car.at_xpath('.//dt[contains(text(),"Skrzynia biegów")]//following-sibling::dd[1]')

  puts image_url ? image_url['src'] : "Brak zdjęcia"
  puts car_name ? car_name.text.strip : "Brak nazwy"
  puts rok_produkcji ? "Rok produkcji: #{rok_produkcji.text.strip}" : "Brak informacji o roku produkcji"
  puts paliwo ? "Rodzaj paliwa: #{paliwo.text.strip}" : "Brak informacji o rodzaju paliwa"
  puts skrzynia_biegow ? "Skrzynia biegów: #{skrzynia_biegow.text.strip}" : "Brak informacji o skrzyni biegów"
  puts "=" * 20
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


