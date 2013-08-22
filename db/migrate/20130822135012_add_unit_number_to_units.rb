class AddUnitNumberToUnits < ActiveRecord::Migration
  def change
    add_column :units, :unit_number, :integer
  end
end
