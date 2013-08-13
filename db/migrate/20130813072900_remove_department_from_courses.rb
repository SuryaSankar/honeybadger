class RemoveDepartmentFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :department, :string
  end
end
