class AddReferenceToTextbooks < ActiveRecord::Migration
  def change
    add_column :textbooks, :reference, :boolean, default: false
  end
end
