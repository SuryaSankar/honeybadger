class AddCourseRefToQpaper < ActiveRecord::Migration
  def change
    add_index :qpapers, :course_id
  end
end
