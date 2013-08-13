class CreateProgramCourses < ActiveRecord::Migration
  def change
    create_table :program_courses do |t|
      t.belongs_to :program
      t.belongs_to :course
      t.integer :semester
      t.boolean :elective
      t.timestamps	
    end
  end
end
