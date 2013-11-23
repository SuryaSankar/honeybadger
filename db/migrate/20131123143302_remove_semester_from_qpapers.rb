class RemoveSemesterFromQpapers < ActiveRecord::Migration
  def change
    remove_column :qpapers, :semester, :integer
  end
end
