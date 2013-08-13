class RemoveUniversityRefFromCourses < ActiveRecord::Migration
  def change
    remove_reference :courses, :university, index: true
  end
end
