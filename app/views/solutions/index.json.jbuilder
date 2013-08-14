json.array!(@solutions) do |solution|
  json.extract! solution, 
  json.url solution_url(solution, format: :json)
end
