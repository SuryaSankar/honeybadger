json.array!(@units) do |unit|
  json.extract! unit, 
  json.url unit_url(unit, format: :json)
end
