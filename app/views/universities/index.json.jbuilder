json.array!(@universities) do |university|
  json.extract! university, 
  json.url university_url(university, format: :json)
end
