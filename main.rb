require_relative 'scraper.rb'
require_relative 'files_generator.rb'

cars_to_sell = Array.new
scraper = Cars_scraper.new(cars_to_sell)
generator = Files_Generator.new
cars_to_sell = scraper.scrap_cars
generator.generate_csv(cars_to_sell)
generator.generate_pdf(cars_to_sell)
