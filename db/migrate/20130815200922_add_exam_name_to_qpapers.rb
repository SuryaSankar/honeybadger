class AddExamNameToQpapers < ActiveRecord::Migration
  def change
    add_column :qpapers, :exam_name, :string
  end
end
