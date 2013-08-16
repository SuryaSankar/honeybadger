class AddSemesterToQpapers < ActiveRecord::Migration
  def change
    add_column :qpapers, :semester, :integer
  end
end
