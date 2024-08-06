# Import pliku (carinfo.rb) oraz modułów
require "csv"
require 'wicked_pdf'
require 'erb'
require_relative 'carinfo.rb'

# Klasa reprezentuje generator plików
#
# Klasa umożliwia wygenerowanie plików CSV i PDF zawierających zescrapowanie dane
class Files_Generator
  # Funkcja generująca plik CSV
  # * arr [Array] - tablica ze zescrapowanymi danymi
  def generate_csv(arr)
    CSV.open("otomoto.csv","w", col_sep: ",", encoding: "UTF-8") do |csv|
      csv << ["LINK","MARKA","MODEL","ROK PRODUKCJI","PALIWO","SKRZYNIA BIEGÓW","PRZEBIEG","POJEMNOŚĆ SKOKOWA","MOC SILNIKA"]
      arr.each do |car|
        fullname = car.nazwa
        dod_info = car.dodatkowe_informacje
        marka, model = fullname.split(" ",2)

        #puts [car.image_url,marka,model,car.rok_produkcji,car.rodzaj_paliwa,car.skrzynia_biegow].inspect
        csv << [car.image_url,marka,model,car.rok_produkcji,car.rodzaj_paliwa,car.skrzynia_biegow,car.przebieg,car.dodatkowe_informacje[0],car.dodatkowe_informacje[1]]
      end
    end
  end
  
  # Funkcja generująca plik CSV
  # * arr [Array] - tablica ze zescrapowanymi danymi
  def generate_pdf(arr)
    arr2 = arr
    html_temp = <<-HTML
    <!DOCTYPE html>
    <html>
    <head>
      <meta charset="utf-8">
      <title>Oferty samochodów</title>
      <style>
        body {
          font-family: Arial, sans-serif;
          margin: 20px;
        }
        .offer {
          border: 1px solid #ccc;
          margin-bottom: 20px;
          padding: 10px;
          display: flex;
          align-items: center;
          page-break-inside: avoid;
        }
        .offer img {
          max-width: 150px;
          margin-right: 20px;
        }
        .offer-details {
          flex: 1;
        }
        .offer-details h2 {
          margin: 0;
          font-size: 18px;
        }
        .offer-details p {
          margin: 5px 0;
          color: #555;
        }
        .offer-details .specs {
          margin: 10px 0;
          font-size: 14px;
          color: #777;
        }
      </style>
    </head>
    <body>
      <h1>Oferty samochodów ze strony otomoto.pl</h1>

      <% arr2.each do |car| %>
        <div class="offer">
          <img src="<%= car.image_url %>" alt="<%= car.nazwa %>">
          <div class="offer-details">
            <h2><%= car.nazwa %> <span>(<%= car.rok_produkcji %>)</span></h2>
            <p>Pojemność skokowa: <%= car.dodatkowe_informacje[0] %> Moc silnika: <%= car.dodatkowe_informacje[1] %></p>
            <div class="specs">
              <p>Rodzaj paliwa: <%= car.rodzaj_paliwa %></p>
              <p>Skrzynia biegów: <%= car.skrzynia_biegow %></p>
              <p>Przebieg: <%= car.przebieg %></p>
            </div>
          </div>
        </div>
      <% end %>
    </body>
    </html>
    HTML

    erb_temp = ERB.new(html_temp)
    html_content = erb_temp.result(binding)
    pdf = WickedPdf.new.pdf_from_string(html_content)
    File.open('oferty.pdf', 'wb') do |file|
      file << pdf
    end
  end
end
