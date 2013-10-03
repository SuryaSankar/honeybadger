class AddCurrentToUniversityCourse < ActiveRecord::Migration
  def change
    add_column :university_courses, :current, :boolean, default: true
  end
end
