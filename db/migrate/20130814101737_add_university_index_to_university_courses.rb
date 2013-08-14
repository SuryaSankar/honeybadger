class AddUniversityIndexToUniversityCourses < ActiveRecord::Migration
  def change
	add_index :university_courses, :university_id
  end
end
