class RemoveNameFromTextbooks < ActiveRecord::Migration
  def change
    remove_column :textbooks, :name, :string
  end
end
