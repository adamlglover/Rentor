require 'open-uri'
require 'nokogiri'
require 'csv'

url = "http://www.zillow.com/homes/for_rent/Shaw-Washington-DC/house,condo,apartment,duplex,townhouse_type/121785_rid/0-815317_price/0-3000_mp/days_sort/38.926114,-77.009976,38.904743,-77.040875_rect/14_zm/"
#url = "http://www.zillow.com/homes/Shaw-Washington-DC_rb/"
page = Nokogiri::HTML(open(url))

#page_numbers = []
 #page.css('ol.zsg-pagination').each do |line|
  #page_numbers << line.text
 #end  
   
#max_page = page_numbers.max.to_i
 
#max_page.times do |i|
  
 # url = "http://www.zillow.com/chicago-il/_p/#{i+1}"
  #page = Nokogiri::HTML(open(url))
  address = []
  page.css('dt.property-address').each do |line|
    address << line.text.strip
end
#routable.mask.hdp-link
website = []
page.css('.routable').each do |line|
  website << line['href']
end

  # Write data to CSV file
    CSV.open("zillow_listings.csv", "w") do |file|
      file << ["Address", "URL"]
      address.length.times do |i|
       
        file << [address[i], website[i]]
      end
    end
   
