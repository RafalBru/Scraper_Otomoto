require 'rspec'
require_relative '../files_generator.rb'
require_relative '../carinfo.rb'

RSpec.describe Files_Generator do
  let(:car1) { Carinfo.new("https://image.url/audi.jpg", "Audi A4", "2020", "Benzyna", "Manualna", "100000 km", ["2000 cm3", "150 KM"]) }
  let(:car2) { Carinfo.new("https://image.url/bmw.jpg", "BMW 3", "2019", "Diesel", "Automatyczna", "50000 km", ["2200 cm3", "180 KM"]) }
  let(:car_array) { [car1, car2] }
  let(:generator) { Files_Generator.new }

  after(:each) do
    File.delete("otomoto.csv") if File.exist?("otomoto.csv")
    File.delete("oferty.pdf") if File.exist?("oferty.pdf")
  end

  describe '#generate_csv' do
    it 'tworzy plik CSV z odpowiednimi danymi' do
      generator.generate_csv(car_array)

      expect(File.exist?('otomoto.csv')).to be_truthy

      csv_content = CSV.read('otomoto.csv', headers: true, encoding: "UTF-8")
      expect(csv_content.length).to eq(2)
      
      expect(csv_content[0]['MARKA']).to eq('Audi')
      expect(csv_content[0]['MODEL']).to eq('A4')
      expect(csv_content[0]['ROK PRODUKCJI']).to eq('2020')
      expect(csv_content[0]['PALIWO']).to eq('Benzyna')
      expect(csv_content[0]['SKRZYNIA BIEGÓW']).to eq('Manualna')

      expect(csv_content[1]['MARKA']).to eq('BMW')
      expect(csv_content[1]['MODEL']).to eq('3')
      expect(csv_content[1]['ROK PRODUKCJI']).to eq('2019')
      expect(csv_content[1]['PALIWO']).to eq('Diesel')
      expect(csv_content[1]['SKRZYNIA BIEGÓW']).to eq('Automatyczna')
    end
  end

  describe '#generate_pdf' do
    it 'tworzy plik PDF' do
      generator.generate_pdf(car_array)

      expect(File.exist?('oferty.pdf')).to be_truthy
    end
  end
end
