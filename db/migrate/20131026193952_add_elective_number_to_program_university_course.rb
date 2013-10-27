class AddElectiveNumberToProgramUniversityCourse < ActiveRecord::Migration
  def change
    add_column :program_university_courses, :elective_no, :integer
  end
end
