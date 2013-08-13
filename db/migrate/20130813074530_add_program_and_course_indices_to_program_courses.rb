class AddProgramAndCourseIndicesToProgramCourses < ActiveRecord::Migration
  def change
	add_index :program_courses, :program_id
	add_index :program_courses, :course_id
  end
end
