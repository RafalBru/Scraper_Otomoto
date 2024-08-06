require 'rspec'
require_relative '../scraper.rb'
require_relative '../carinfo.rb'

RSpec.describe Cars_scraper do
  let(:scraped_cars) { [] }
  let(:scraper) { Cars_scraper.new(scraped_cars) }

  describe '#scrapowanie_danych' do
    it 'powinno zwrócić tablicę obiektów Carinfo' do
      result = scraper.scrap_cars

      expect(result).to be_an(Array)
      expect(result).not_to be_empty
      expect(result.first).to be_a(Carinfo)
    end

    it 'powinno poprawnie scrapować dane z samochodów' do
      result = scraper.scrap_cars

      car = result.first

      expect(car.image_url).to be_a(String)
      expect(car.nazwa).to be_a(String)
      expect(car.rok_produkcji).to match(/^\d{4}$/)
      expect(car.rodzaj_paliwa).to be_a(String)
      expect(car.skrzynia_biegow).to be_a(String)
      expect(car.przebieg).to match(/^[\d\s]+km$/)
      expect(car.dodatkowe_informacje).to be_an(Array)
      expect(car.dodatkowe_informacje.size).to be > 0
    end
  end
end
