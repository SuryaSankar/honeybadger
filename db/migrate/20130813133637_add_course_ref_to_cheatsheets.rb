class AddCourseRefToCheatsheets < ActiveRecord::Migration
  def change
    add_reference :cheatsheets, :course, index: true
  end
end
