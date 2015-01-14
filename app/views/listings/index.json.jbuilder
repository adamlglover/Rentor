json.array!(@listings) do |listing|
  json.extract! listing, :id, :latitude, :longitude, :address, :price, :url, :description
  json.url listing_url(listing, format: :json)
end
