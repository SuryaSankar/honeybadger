json.array!(@program_university_courses) do |program_university_course|
  json.extract! program_university_course, 
  json.url program_university_course_url(program_university_course, format: :json)
end
