class AddCourseRefToUnits < ActiveRecord::Migration
  def change
    add_reference :units, :course, index: true
  end
end
