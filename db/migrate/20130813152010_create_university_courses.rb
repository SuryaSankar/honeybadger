class CreateUniversityCourses < ActiveRecord::Migration
  def change
    create_table :university_courses do |t|
	t.belongs_to :university
	t.belongs_to :course
	t.string :course_code
    end
  end
end
