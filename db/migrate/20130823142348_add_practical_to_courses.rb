class AddPracticalToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :practical, :boolean
  end
end
