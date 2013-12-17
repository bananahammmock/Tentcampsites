json.array!(@campsites) do |campsite|
  json.extract! campsite, :id, :name, :description, :state_id, :region_id
  json.url campsite_url(campsite, format: :json)
end
