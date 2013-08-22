class AddUnitCurriculumToUnits < ActiveRecord::Migration
  def change
    add_column :units, :unit_curriculum, :text
  end
end
