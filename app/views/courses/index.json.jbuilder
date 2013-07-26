json.array!(@courses) do |course|
  json.extract! course, :index, :show, :new, :edit, :create, :update, :destroy
  json.url course_url(course, format: :json)
end
