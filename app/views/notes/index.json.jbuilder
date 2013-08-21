json.array!(@notes) do |note|
  json.extract! note, 
  json.url note_url(note, format: :json)
end
