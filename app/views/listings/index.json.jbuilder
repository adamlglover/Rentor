json.array!(@listings) do |listing|
  json.extract! listing, :id, :latitude, :longitude, :address, :url, :description
  json.url listing_url(listing, format: :json)
end
