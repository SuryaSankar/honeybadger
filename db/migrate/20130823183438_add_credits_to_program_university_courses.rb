class AddCreditsToProgramUniversityCourses < ActiveRecord::Migration
  def change
    add_column :program_university_courses, :credits, :integer
  end
end
