class AddCourseIndexToUniversityCourses < ActiveRecord::Migration
  def change
	add_index :university_courses, :course_id
  end
end
