class Listing < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
  
  def self.import(file)
  CSV.foreach(file.path, headers: true) do |row|
    Listing.create! row.to_hash
  end
end
  
end