json.array!(@qpapers) do |qpaper|
  json.extract! qpaper, :index, :show, :new, :edit, :create, :update, :destroy
  json.url qpaper_url(qpaper, format: :json)
end
