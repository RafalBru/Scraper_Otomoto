require 'rspec'
require_relative '../carinfo.rb'

RSpec.describe Carinfo do
  let(:image_url) { "https://example.com/car.jpg" }
  let(:nazwa) { "Audi A4" }
  let(:rok_produkcji) { "2020" }
  let(:rodzaj_paliwa) { "Benzyna" }
  let(:skrzynia_biegow) { "Manualna" }
  let(:przebieg) { "100000 km" }
  let(:dodatkowe_informacje) { ["2000 cm3", "150 KM"] }

  let(:car) { Carinfo.new(image_url, nazwa, rok_produkcji, rodzaj_paliwa, skrzynia_biegow, przebieg, dodatkowe_informacje) }

  describe '#initialize' do
    it 'poprawnie inicjalizuje obiekt' do
      expect(car.image_url).to eq(image_url)
      expect(car.nazwa).to eq(nazwa)
      expect(car.rok_produkcji).to eq(rok_produkcji)
      expect(car.rodzaj_paliwa).to eq(rodzaj_paliwa)
      expect(car.skrzynia_biegow).to eq(skrzynia_biegow)
      expect(car.przebieg).to eq(przebieg)
      expect(car.dodatkowe_informacje).to eq(dodatkowe_informacje)
    end
  end

  describe '#print_info' do
    it 'wyświetla poprawne informacje o samochodzie' do
      expect { car.print_info }.to output(
        "Link do obrazu: #{image_url}\n" \
        "Samochód: #{nazwa}, Rok produkcji: #{rok_produkcji}\n" \
        "Rodzaj paliwa: #{rodzaj_paliwa}, Skrzynia biegów: #{skrzynia_biegow}\n" \
        "Przebieg: #{przebieg}\n" \
        "Pojemnosc silnika: #{dodatkowe_informacje[0]}, Moc silnika: #{dodatkowe_informacje[1]}\n"
      ).to_stdout
    end
  end
end
