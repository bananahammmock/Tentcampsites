json.array!(@states) do |state|
  json.extract! state, :id, :name, :description
  json.url state_url(state, format: :json)
end
