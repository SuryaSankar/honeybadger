json.array!(@university_courses) do |university_course|
  json.extract! university_course, 
  json.url university_course_url(university_course, format: :json)
end
