class CreateProgramUniversityCourses < ActiveRecord::Migration
  def change
    create_table :program_university_courses do |t|
      t.belongs_to :program
      t.belongs_to :university_course
      t.integer :semester
      t.boolean :elective
      t.timestamps
    end
  end
end
