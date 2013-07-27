json.array!(@examquestions) do |examquestion|
  json.extract! examquestion, 
  json.url examquestion_url(examquestion, format: :json)
end
