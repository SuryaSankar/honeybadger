class RemoveOutdatedFromUniversityCourse < ActiveRecord::Migration
  def change
    remove_column :university_courses, :outdated, :string
  end
end
