class DropProgramCoursesTable < ActiveRecord::Migration
  def change
	remove_column :program_courses, :course_id
	remove_column :program_courses, :program_id
	drop_table :program_courses
  end
end
