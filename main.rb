require_relative 'scraper.rb'
require_relative 'files_generator.rb'

cars_to_sell = Array.new
scraper = Cars_scraper.new(cars_to_sell)
generator = Files_Generator.new
cars_to_sell = scraper.scrap_cars
generator.generate_csv(cars_to_sell)
generator.generate_pdf(cars_to_sell)


# def generate_csv(cars)
#   CSV.open("otomoto.csv","w", col_sep: "\t") do |csv|
#     csv << ["LINK","MARKA","MODEL","ROK PRODUKCJI","PALIWO","SKRZYNIA BIEGÓW"]
#     cars.each do |car|
#       fullname = car.nazwa
#       marka, model = fullname.split(" ",2)
#       #puts [car.image_url,marka,model,car.rok_produkcji,car.rodzaj_paliwa,car.skrzynia_biegow].inspect
#       csv << [car.image_url,marka,model,car.rok_produkcji,car.rodzaj_paliwa,car.skrzynia_biegow]
#     end
#   end
# end

# cars_to_sell = []
# page = 1
# 4.times do
#   puts "Page #{page}"
#   response = HTTParty.get("https://www.otomoto.pl/osobowe?page=#{page}")
#   doc = Nokogiri::HTML(response.body)
#   cars = doc.xpath('//section')
  
#   cars.each do |car|
#     image_url = car.at_xpath('.//img')&.[]('src')
#     car_name = car.at_xpath('.//h1//a')&.text&.strip
#     rok_produkcji = car.at_xpath('.//dt[contains(text(),"Rok produkcji")]//following-sibling::dd[1]')&.text&.strip
#     paliwo = car.at_xpath('.//dt[contains(text(),"Rodzaj paliwa")]//following-sibling::dd[1]')&.text&.strip
#     skrzynia_biegow = car.at_xpath('.//dt[contains(text(),"Skrzynia biegów")]//following-sibling::dd[1]')&.text&.strip
  
#     if car_name && rok_produkcji && paliwo && skrzynia_biegow
#       car_info = Carinfo.new(
#         image_url,
#         car_name,
#         rok_produkcji,
#         paliwo,
#         skrzynia_biegow)
#       cars_to_sell.push(car_info)
#       car_info.print_info
#     end
#   end
#   page += 1
# end
#{}generate_csv(cars_to_sell)

