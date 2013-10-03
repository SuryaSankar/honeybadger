class AddOutdatedToUniversityCourse < ActiveRecord::Migration
  def change
    add_column :university_courses, :outdated, :string
    add_column :university_courses, :boolean, :string
  end
end
