class RemoveBooleanFromUniversityCourse < ActiveRecord::Migration
  def change
    remove_column :university_courses, :boolean, :string
  end
end
