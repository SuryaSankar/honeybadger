class AddUniversityCourseRefToUnits < ActiveRecord::Migration
  def change
    add_reference :units, :university_course, index: true
  end
end
