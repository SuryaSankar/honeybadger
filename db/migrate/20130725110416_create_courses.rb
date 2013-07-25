class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :semester
      t.string :department

      t.timestamps
    end
  end
end
