json.array!(@qpaper_files) do |qpaper_file|
  json.extract! qpaper_file, 
  json.url qpaper_file_url(qpaper_file, format: :json)
end
