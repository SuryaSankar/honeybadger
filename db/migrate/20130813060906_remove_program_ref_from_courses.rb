class RemoveProgramRefFromCourses < ActiveRecord::Migration
  def change
    remove_reference :courses, :program, index: true
  end
end
