class AddNameToTextbooks < ActiveRecord::Migration
  def change
    add_column :textbooks, :name, :text
  end
end
