json.array!(@branches) do |branch|
  json.extract! branch, 
  json.url branch_url(branch, format: :json)
end
