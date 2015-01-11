require 'open-uri'
require 'nokogiri'
require 'csv'

url = "http://www.realtor.com/apartments/Logan-Circle-Shaw_Washington_DC"
page = Nokogiri::HTML(open(url))

  
latitude = []
page.css('div.listing-geo').each do |line|
  latitude << line.css('meta[@itemprop="latitude"]').attr('content')
 # latitude << "#{latitude}"
end
 
longitude = []
page.css('div.listing-geo').each do |line|  
  longitude << line.css('meta[@itemprop="longitude"]').attr('content')
#  longitude << "#{longitude}"
end

address = []
page.css('span.listing-street-address').each do |line|
  address << line.text.strip
end

website = []
page.css('div.listing-wrap').each do |line|
  website << line['href']
end


  # Write data to CSV file
CSV.open("realtor_listings.csv", "w") do |file|
  file << ["Latitude", "Longitude", "Address", "Website"]
  latitude.length.times do |i|
    file << [latitude[i], longitude[i], address[i], website[i]]
      end
end
