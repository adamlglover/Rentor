require 'open-uri'
require 'nokogiri'
require 'csv'

url = "http://www.realtor.com/apartments/Logan-Circle-Shaw_Washington_DC"
page = Nokogiri::HTML(open(url))

website = []
page.css('a.ellipsis').each do |line|
  puts line['href']
end


  # Write data to CSV file
#CSV.open("test_listings.csv", "w") do |file|
 # file << ["Website"]
  #website.length.times do |i|
   # file << [website[i]]
    #  end
#end
