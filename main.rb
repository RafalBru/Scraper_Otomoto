require "httparty"
require "nokogiri"
require "csv"
require_relative "carinfo.rb"

response = HTTParty.get("https://www.otomoto.pl/osobowe?page=1")
def generate_csv(cars)
  CSV.open("otomoto.tsv","wb",col_sep:"\t") do |csv|
    csv << ["LINK","MARKA","MODEL","ROK PRODUKCJI","PALIWO","SKRZYNIA BIEGÓW"]
    cars.each do |car|
      fullname = car.nazwa
      marka, model = fullname.split(" ",2)
      csv << [car.image_url,marka,model,car.rok_produkcji,car.rodzaj_paliwa,car.skrzynia_biegow]
    end
  end
end

cars_to_sell = []
doc = Nokogiri::HTML(response.body)
cars = doc.xpath('//section')

cars.each do |car|
  image_url = car.at_xpath('.//img')&.[]('src')
  car_name = car.at_xpath('.//h1//a')&.text&.strip
  rok_produkcji = car.at_xpath('.//dt[contains(text(),"Rok produkcji")]//following-sibling::dd[1]')&.text&.strip
  paliwo = car.at_xpath('.//dt[contains(text(),"Rodzaj paliwa")]//following-sibling::dd[1]')&.text&.strip
  skrzynia_biegow = car.at_xpath('.//dt[contains(text(),"Skrzynia biegów")]//following-sibling::dd[1]')&.text&.strip

  if car_name && rok_produkcji && paliwo && skrzynia_biegow
    car_info = Carinfo.new(
      image_url,
      car_name,
      rok_produkcji,
      paliwo,
      skrzynia_biegow)
      cars_to_sell.push(car_info)
  end
  # cars_to_sell.each do |car|
  #   car.print_info
  # end
  generate_csv(cars_to_sell)

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


