class AddTimestampsToUniversityCourse < ActiveRecord::Migration
  def change
    add_column :university_courses, :created_at, :datetime
    add_column :university_courses, :updated_at, :datetime
  end
end
