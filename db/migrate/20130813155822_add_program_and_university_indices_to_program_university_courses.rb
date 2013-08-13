class AddProgramAndUniversityIndicesToProgramUniversityCourses < ActiveRecord::Migration
  def change
	add_index :program_university_courses, :program_id
	add_index :program_university_courses, :university_course_id
  end
end
