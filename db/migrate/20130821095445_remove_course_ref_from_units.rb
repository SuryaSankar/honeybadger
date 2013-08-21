class RemoveCourseRefFromUnits < ActiveRecord::Migration
  def change
    remove_reference :units, :course, index: true
  end
end
