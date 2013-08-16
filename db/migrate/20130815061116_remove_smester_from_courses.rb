class RemoveSmesterFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :semester, :integer
  end
end
